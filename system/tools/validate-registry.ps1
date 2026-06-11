# ADC-SYS-001 registry validator — zero dependencies, Windows PowerShell 5.1.
# Checks structural integrity of system/registry: JSON parse, cross-references,
# parameter schema, open-item linkage. Exit 0 = pass, 1 = fail.

$ErrorActionPreference = 'Stop'
$root = Join-Path $PSScriptRoot '..\registry'
$failures = @()
$warnings = @()

function Load-Json($path) {
    try { return (Get-Content $path -Raw -Encoding UTF8) | ConvertFrom-Json }
    catch { $script:failures += "PARSE: $path -- $($_.Exception.Message)"; return $null }
}

$assetFiles = Get-ChildItem (Join-Path $root 'assets') -Filter *.json
$ifaceFiles = Get-ChildItem (Join-Path $root 'interfaces') -Filter *.json
$assets = @{}; $ifaces = @{}

foreach ($f in $assetFiles) { $j = Load-Json $f.FullName; if ($j) { $assets[$j.id] = $j
    if ($f.BaseName -ne $j.id) { $failures += "ID/FILENAME mismatch: $($f.Name) declares id '$($j.id)'" } } }
foreach ($f in $ifaceFiles) { $j = Load-Json $f.FullName; if ($j) { $ifaces[$j.id] = $j
    if ($f.BaseName -ne $j.id) { $failures += "ID/FILENAME mismatch: $($f.Name) declares id '$($j.id)'" } } }

# Cross-references: interface.between -> assets; asset.interfaces -> interfaces
foreach ($i in $ifaces.Values) {
    foreach ($a in $i.between) {
        if (-not $assets.ContainsKey($a)) { $failures += "INTERFACE '$($i.id)' references unknown asset '$a'" } } }
foreach ($a in $assets.Values) {
    foreach ($i in $a.interfaces) {
        if (-not $ifaces.ContainsKey($i)) { $failures += "ASSET '$($a.id)' references unknown interface '$i'" } } }

# Reciprocity: if an interface names an asset, that asset should list the interface
foreach ($i in $ifaces.Values) {
    foreach ($a in $i.between) {
        if ($assets.ContainsKey($a) -and ($assets[$a].interfaces -notcontains $i.id)) {
            $warnings += "RECIPROCITY: interface '$($i.id)' includes asset '$a' but $a.json does not list it" } } }

# Parameter schema: key, value, tag in L/W/O, source
$paramCount = 0; $criticalCount = 0; $tagTally = @{ L = 0; W = 0; O = 0 }
foreach ($node in ($assets.Values + $ifaces.Values)) {
    foreach ($p in $node.parameters) {
        $paramCount++
        if (-not $p.key)    { $failures += "PARAM in '$($node.id)' missing key" }
        if ($null -eq $p.value) { $failures += "PARAM '$($node.id).$($p.key)' missing value" }
        if (-not $p.source) { $failures += "PARAM '$($node.id).$($p.key)' missing source" }
        if ($p.tag -notin @('L','W','O')) { $failures += "PARAM '$($node.id).$($p.key)' bad tag '$($p.tag)' (must be L/W/O)" }
        else { $tagTally[$p.tag]++ }
        if ($p.critical) { $criticalCount++
            if ($p.tag -ne 'L') { $failures += "PARAM '$($node.id).$($p.key)' is critical but not tagged [L]" } } } }

# Open items: unique ids, valid product, related/gates linkage
$oi = Load-Json (Join-Path $root 'open-items.json')
$itemIds = @{}
if ($oi) {
    foreach ($item in $oi.items) {
        if ($itemIds.ContainsKey($item.id)) { $failures += "OPEN-ITEM duplicate id '$($item.id)'" }
        $itemIds[$item.id] = $item
        if ($item.product -ne 'system' -and -not $assets.ContainsKey($item.product)) {
            $failures += "OPEN-ITEM '$($item.id)' unknown product '$($item.product)'" } }
    foreach ($item in $oi.items) {
        foreach ($r in $item.related) {
            if (-not $itemIds.ContainsKey($r)) { $failures += "OPEN-ITEM '$($item.id)' related unknown item '$r'" } } } }

# Report
Write-Output "=== ADC-SYS-001 registry validation ==="
Write-Output ("Assets: {0}   Interfaces: {1}   Parameters: {2} (critical: {3})   Tags L/W/O: {4}/{5}/{6}   Open items: {7}" -f `
    $assets.Count, $ifaces.Count, $paramCount, $criticalCount, $tagTally.L, $tagTally.W, $tagTally.O, $itemIds.Count)
$byProduct = $oi.items | Group-Object product | Sort-Object Name
foreach ($g in $byProduct) { Write-Output ("  open items - {0}: {1}" -f $g.Name, $g.Count) }
if ($warnings.Count) { Write-Output "--- WARNINGS ---"; $warnings | ForEach-Object { Write-Output "  $_" } }
if ($failures.Count) { Write-Output "--- FAILURES ---"; $failures | ForEach-Object { Write-Output "  $_" }; Write-Output "RESULT: FAIL"; exit 1 }
Write-Output "RESULT: PASS"
exit 0
