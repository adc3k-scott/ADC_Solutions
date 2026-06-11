# ADC executable twin -- load-step scenario generator (MGN-TEL-001 par. 10).
# Reads design constants from the ADC-SYS-001 registry, simulates the coherent
# AI training step at 1 s (Class B) cadence, and writes dashboard/timeline.js.
# Zero dependencies; Windows PowerShell 5.1. ASCII only (PS 5.1 reads ANSI).

$ErrorActionPreference = 'Stop'
$root = Join-Path $PSScriptRoot '..\..'
$iface = (Get-Content (Join-Path $root 'registry\interfaces\node-compute-electrical.json') -Raw) | ConvertFrom-Json
function P($key) { ($iface.parameters | Where-Object { $_.key -eq $key }).value }

$stepMW    = [double](P 'design_coherent_step_mw')   # 5.0 -- the coherent AI step
$pcsMW     = [double](P 'bess_pcs_mw')               # 6.0 -- BESS clamp
$rampS     = [double](P 'genset_ramp_s')             # 45  -- gas block-load ramp
$bessMWh   = [double](P 'bess_energy_mwh_usable')    # 3.0
$rideTcsS  = [double](P 'thermal_ride_through_tcs_s')# 24  -- annotation only

$baseMW   = 5.0      # node baseline IT load (10 MW firm node at 50%)
$socStart = 85.0     # %
$supplyC  = 30.0     # TCS supply temperature held by CDU approach control
$tMin = -60; $tMax = 180

function Smooth($x) { if ($x -le 0) { return 0.0 }; if ($x -ge 1) { return 1.0 }; return $x * $x * (3 - 2 * $x) }

$rows = @()
$soc = $socStart; $dT = 5.0   # bay ITE delta-T at baseline (1 MW bay load)
foreach ($t in $tMin..$tMax) {
    # D2 cause: utilization climbs t-30..0, coherent step at t=0
    $util = 25 + 70 * (Smooth (($t + 30) / 30.0))
    $load = $baseMW; if ($t -ge 0) { $load = $baseMW + $stepMW }

    # D1 response: governor dead time ~2 s, staged lean-burn ramp over rampS
    $gen = $baseMW + $stepMW * (Smooth (($t - 2) / ($rampS - 2)))
    if ($t -lt 2) { $gen = $baseMW }

    # D1 bridge: BESS covers the difference, clamped to the PCS rating
    $bess = [Math]::Max([Math]::Min($load - $gen, $pcsMW), -$pcsMW)
    $soc = $soc - ($bess / 3600.0) / $bessMWh * 100.0   # 1 s step
    # bus frequency: grid-forming PCS holds the dip shallow, recovers ~5 s
    $freq = 60.0; if ($t -ge 0) { $freq = 60.0 - 0.30 * [Math]::Exp(-$t / 1.8) }

    # AI pre-position (Deschutes Loop 1): pump dP raised at t=-20 on D2 utilization
    $pump = 25.0 + 5.0 * (Smooth (($t + 20) / 10.0))

    # D3 follower: one Reference Bay (load/5 of the node) heats the loop,
    # first-order lag tau 40 s toward delta-T = 10 K at 2 MW bay load
    $bay = $load / 5.0
    $dTtarget = 5.0 * $bay
    $dT = $dT + ($dTtarget - $dT) * (1 - [Math]::Exp(-1.0 / 40.0))

    $rows += ('{{"t":{0},"util":{1},"load":{2},"gen":{3},"bess":{4},"soc":{5},"freq":{6},"pump":{7},"dT":{8},"ret":{9}}}' -f `
        $t, [Math]::Round($util,1), [Math]::Round($load,3), [Math]::Round($gen,3), [Math]::Round($bess,3), `
        [Math]::Round($soc,3), [Math]::Round($freq,3), [Math]::Round($pump,2), [Math]::Round($dT,3), [Math]::Round($supplyC + $dT,3))
}

$meta = ('{{"stepMW":{0},"pcsMW":{1},"rampS":{2},"bessMWh":{3},"rideTcsS":{4},"generated":"from ADC-SYS-001 registry by run-scenario.ps1"}}' -f `
    $stepMW, $pcsMW, $rampS, $bessMWh, $rideTcsS)
$js = "window.TIMELINE = {`"meta`": $meta, `"rows`": [`n" + ($rows -join ",`n") + "`n]};`n"
$out = Join-Path $root 'twin\dashboard\timeline.js'
New-Item -ItemType Directory -Force (Split-Path $out) | Out-Null
[System.IO.File]::WriteAllText($out, $js)
Write-Output ("Wrote {0} samples to {1}" -f $rows.Count, $out)
$peak = ($rows | ForEach-Object { ($_ | ConvertFrom-Json).bess } | Measure-Object -Maximum).Maximum
Write-Output ("Peak BESS discharge: {0} MW (PCS rating {1} MW)" -f $peak, $pcsMW)
