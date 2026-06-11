# TEL-PROFILE conformance checker -- zero dependencies, Windows PowerShell 5.1.
# Walks the twin Redfish mockup tree (system/twin/redfish/redfish/v1) and asserts
# it against the draft site interoperability profile
# (system/twin/profile/adc-site-interop-profile-draft.json):
#   - every profile resource class has at least one instance in the tree
#   - every Mandatory property is present (and non-null) on every instance
#   - Recommended properties absent -> warning; IfImplemented -> not asserted
#   - service root RedfishVersion >= Protocol.MinVersion
#   - every @odata.id reference resolves to a resource in the tree (no dangling
#     links), and each resource's @odata.id agrees with its folder path
# ConditionalRequirements in the draft are prose-only -> counted, not asserted.
# This is the executable form of the ADC-OS-001 conformance contract: a bridge
# endpoint dumped as a DMTF-style mockup tree must pass before the Telemetry OS
# trusts it. Exit 0 = pass, 1 = fail.
param(
    [string]$TwinRoot    = (Join-Path $PSScriptRoot '..\twin\redfish\redfish\v1'),
    [string]$ProfilePath = (Join-Path $PSScriptRoot '..\twin\profile\adc-site-interop-profile-draft.json')
)
$ErrorActionPreference = 'Stop'
$failures = @(); $warnings = @()

$prof = (Get-Content $ProfilePath -Raw -Encoding UTF8) | ConvertFrom-Json
$TwinRoot = (Resolve-Path $TwinRoot).Path.TrimEnd('\')

# --- index every resource: @odata.id -> object, and group by schema class ---
$resources = @{}; $byType = @{}
$files = Get-ChildItem $TwinRoot -Recurse -Filter index.json
foreach ($f in $files) {
    try { $j = (Get-Content $f.FullName -Raw -Encoding UTF8) | ConvertFrom-Json }
    catch { $failures += "PARSE: $($f.FullName) -- $($_.Exception.Message)"; continue }
    $oid = $j.'@odata.id'; $otype = $j.'@odata.type'
    if (-not $oid)   { $failures += "RESOURCE missing @odata.id: $($f.FullName)"; continue }
    if (-not $otype) { $failures += "RESOURCE '$oid' missing @odata.type"; continue }
    $expected = '/redfish/v1' + ($f.DirectoryName.Substring($TwinRoot.Length) -replace '\\', '/')
    if ($oid -ne $expected) { $failures += "PATH/ID mismatch: folder '$expected' declares @odata.id '$oid'" }
    if ($resources.ContainsKey($oid)) { $failures += "DUPLICATE @odata.id '$oid'" }
    $resources[$oid] = $j
    # '#Chassis.v1_26_0.Chassis' -> 'Chassis' (last dot segment = schema class)
    $tname = ($otype.TrimStart('#') -split '\.')[-1]
    if (-not $byType.ContainsKey($tname)) { $byType[$tname] = @() }
    $byType[$tname] += ,@{ id = $oid; obj = $j }
}

# --- protocol floor ---
if ($prof.Protocol.MinVersion) {
    $sroot = $resources['/redfish/v1']
    if (-not $sroot) { $failures += 'SERVICE ROOT /redfish/v1 not found in tree' }
    elseif ([version]$sroot.RedfishVersion -lt [version]$prof.Protocol.MinVersion) {
        $failures += "PROTOCOL: RedfishVersion $($sroot.RedfishVersion) below profile MinVersion $($prof.Protocol.MinVersion)" }
}

# --- profile resource classes: instance coverage + property requirements ---
$classCount = 0; $instCount = 0; $mandatoryAsserts = 0; $condCount = 0
foreach ($rp in $prof.Resources.PSObject.Properties) {
    $rtype = $rp.Name; $req = $rp.Value; $classCount++
    if ($req.ConditionalRequirements) { $condCount += @($req.ConditionalRequirements).Count }
    $instances = $byType[$rtype]
    if (-not $instances -or $instances.Count -eq 0) {
        $failures += "CLASS '$rtype': required by profile, no instances in tree"; continue }
    foreach ($inst in $instances) {
        $instCount++
        foreach ($pp in $req.PropertyRequirements.PSObject.Properties) {
            $pname = $pp.Name; $rr = $pp.Value.ReadRequirement
            $present = ($null -ne $inst.obj.PSObject.Properties[$pname]) -and ($null -ne $inst.obj.$pname)
            switch ($rr) {
                'Mandatory'     { $mandatoryAsserts++
                                  if (-not $present) { $failures += "MANDATORY '$rtype.$pname' missing on $($inst.id)" } }
                'Recommended'   { if (-not $present) { $warnings += "RECOMMENDED '$rtype.$pname' absent on $($inst.id)" } }
                'IfImplemented' { }
                default         { $warnings += "PROFILE: unknown ReadRequirement '$rr' on $rtype.$pname (not asserted)" }
            }
        }
    }
}

# --- link integrity: every @odata.id reference resolves (fragment refs skipped) ---
function Get-OdataRefs($node) {
    $refs = @()
    if ($node -is [System.Management.Automation.PSCustomObject]) {
        foreach ($p in $node.PSObject.Properties) {
            if ($p.Name -eq '@odata.id') { if ($p.Value -is [string]) { $refs += $p.Value } }
            else { $refs += Get-OdataRefs $p.Value }
        }
    } elseif (($node -is [System.Collections.IEnumerable]) -and ($node -isnot [string])) {
        foreach ($e in $node) { $refs += Get-OdataRefs $e }
    }
    return $refs
}
$linkChecks = 0
foreach ($oid in $resources.Keys) {
    foreach ($ref in (Get-OdataRefs $resources[$oid])) {
        if ($ref -eq $oid -or $ref.Contains('#')) { continue }
        $linkChecks++
        if (-not $resources.ContainsKey($ref)) { $failures += "LINK: '$oid' references '$ref' -- no such resource in tree" }
    }
}

# --- report ---
Write-Output ("=== TEL-PROFILE conformance check ({0} v{1}) ===" -f $prof.ProfileName, $prof.ProfileVersion)
Write-Output ("Tree: {0}" -f $TwinRoot)
Write-Output ("Resources: {0}   Profile classes: {1}   Instances checked: {2}   Mandatory asserts: {3}   Links resolved: {4}" -f `
    $resources.Count, $classCount, $instCount, $mandatoryAsserts, $linkChecks)
foreach ($rp in $prof.Resources.PSObject.Properties) {
    $n = 0; if ($byType.ContainsKey($rp.Name)) { $n = $byType[$rp.Name].Count }
    Write-Output ("  {0}: {1} instance(s)" -f $rp.Name, $n)
}
if ($condCount) { Write-Output ("NOTE: {0} ConditionalRequirements are prose-only in the draft profile -- not machine-asserted (TEL-002 converts them to named properties)" -f $condCount) }
if ($warnings.Count) { Write-Output '--- WARNINGS ---'; $warnings | ForEach-Object { Write-Output "  $_" } }
if ($failures.Count) { Write-Output '--- FAILURES ---'; $failures | ForEach-Object { Write-Output "  $_" }; Write-Output 'RESULT: FAIL'; exit 1 }
Write-Output 'RESULT: PASS'
exit 0
