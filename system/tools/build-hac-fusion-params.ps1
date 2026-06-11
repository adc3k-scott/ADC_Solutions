# ADC HAC bay -- Fusion 360 parameter export generator (HAC-OI-05).
# Verifies the dimension table against the ADC-SYS-001 registry, then emits:
#   products/HAC/fusion360/adc-hac-bay-params.csv        (ParameterIO add-in format)
#   products/HAC/fusion360/create_adc_hac_parameters.py  (native Fusion script)
# Zero dependencies; Windows PowerShell 5.1; ASCII only.

$ErrorActionPreference = 'Stop'
$base = Join-Path $PSScriptRoot '..\..'
$reg  = Join-Path $base 'system\registry'
$out  = Join-Path $base 'products\HAC\fusion360'
New-Item -ItemType Directory -Force $out | Out-Null

# --- registry coupling: these numbers MUST match the registry or we stop ---
$hac = (Get-Content (Join-Path $reg 'interfaces\hac-structural.json') -Raw) | ConvertFrom-Json
$wmf = (Get-Content (Join-Path $reg 'interfaces\wmf-plane.json') -Raw) | ConvertFrom-Json
function Get-RegVal($doc, $key) { ($doc.parameters | Where-Object { $_.key -eq $key }).value }
$checks = @(
    @{ doc = $hac; key = 'post_centers_across_aisle_in'; expect = 90 },
    @{ doc = $hac; key = 'bay_width_post_centers_in';    expect = 121 },
    @{ doc = $hac; key = 'hot_aisle_with_rdhx_in';       expect = 68.41 },
    @{ doc = $hac; key = 'width_between_base_plates_in'; expect = 114 },
    @{ doc = $hac; key = 'overall_height_aff_in';        expect = 168 },
    @{ doc = $hac; key = 'level2_elevation_in';          expect = 115.5 },
    @{ doc = $hac; key = 'level3_elevation_in';          expect = 127.5 },
    @{ doc = $hac; key = 'level4_elevation_in';          expect = 139.5 },
    @{ doc = $wmf; key = 'elevation_aff_in';             expect = 100.5 })
foreach ($c in $checks) {
    $v = Get-RegVal $c.doc $c.key
    if ([double]$v -ne [double]$c.expect) {
        throw ("REGISTRY MISMATCH: {0} = {1}, generator table expects {2}. Update this generator deliberately, then re-run." -f $c.key, $v, $c.expect)
    }
}
Write-Output ("Registry check: {0}/{0} critical dimensions verified." -f $checks.Count)

# --- parameter table: Name, Unit ('' = unitless count), Expression, Comment ---
$params = @(
    # critical interface dimensions
    @('ADC_PostCentersAcrossAisle', 'in', '90',     'CRITICAL OCP Redmond (Deschutes 18) - do not alter'),
    @('ADC_BayWidthPostCenters',    'in', '121',    'CRITICAL OCP Redmond (Deschutes 18) - do not alter'),
    @('ADC_HotAisleWithRDHx',       'in', '68.41',  'CRITICAL OCP Redmond (Deschutes 18) - do not alter'),
    @('ADC_WidthBetweenBasePlates', 'in', '114',    'CRITICAL OCP Redmond (Deschutes 18) - do not alter'),
    @('ADC_BasePlateOuterEnvelope', 'in', '102',    'CRITICAL OCP Redmond - do not alter (Fig 18.3.1; OCP table prints 2210 mm in error - HAC-OI-02)'),
    @('ADC_OverallHeightAFF',       'in', '168',    'CRITICAL OCP Redmond (Deschutes 18) - do not alter'),
    @('ADC_Level1_WMF',             'in', '100.5',  'CRITICAL OCP Redmond - do not alter - WMF/TCS header plane, shared with TCS'),
    @('ADC_Level2_Cabling',         'in', '115.5',  'CRITICAL OCP Redmond (Deschutes 18) - do not alter'),
    @('ADC_Level3_Cabling',         'in', '127.5',  'CRITICAL OCP Redmond (Deschutes 18) - do not alter'),
    @('ADC_Level4_Cabling',         'in', '139.5',  'CRITICAL OCP Redmond - do not alter - space above is Colo domain'),
    @('ADC_RackWidth',              'in', '28',     'CRITICAL OCP Redmond 18.1 - do not alter'),
    @('ADC_RackDepthMax',           'in', '50',     'CRITICAL OCP Redmond 18.1 - do not alter (front-justified)'),
    @('ADC_RackHeightMax',          'in', '90.55',  'CRITICAL OCP Redmond 18.1 - do not alter'),
    @('ADC_RackGap',                'mm', '5.05',   'CRITICAL OCP Redmond Fig 18.3.1 - do not alter'),
    @('ADC_ColdAisleMin',           'in', '54',     'CRITICAL OCP Redmond Table 18.2.1 minimum - do not alter'),
    @('ADC_MinRowLength',           'ft', '46',     'CRITICAL OCP Redmond Table 18.2.1 - do not alter'),
    @('ADC_MinCeilingHeight',       'ft', '14',     'CRITICAL OCP Redmond Table 18.2.1 - do not alter'),
    # structure members (locked design, Fig 18.5.1 / Detail A)
    @('ADC_PostHSS_Size',           'in', '5',      'HSS 5x5x1/4 vertical post'),
    @('ADC_PostHSS_Wall',           'in', '0.25',   'HSS wall thickness'),
    @('ADC_BasePlateW',             'in', '12',     'Base plate 12 x 8.5 x 5/8'),
    @('ADC_BasePlateD',             'in', '8.5',    'Base plate depth'),
    @('ADC_BasePlateThk',           'in', '0.625',  'Base plate 5/8 thickness'),
    @('ADC_AnchorBoltDia',          'in', '0.625',  '4x 5/8 anchor bolts per plate'),
    @('ADC_HangerProjection',       'in', '49.05',  'Cantilever tray arm projection (Detail A, both sides)'),
    @('ADC_HangerBoxSize',          'in', '3.25',   'Arm section 3-1/4 x 3-1/4 box, 2x deep strut welded'),
    @('ADC_BasketWideW',            'in', '24',     '24x4 wire basket (Levels 2, 3, 4-1)'),
    @('ADC_BasketWideH',            'in', '4',      'Basket sits 4.00 proud of arm'),
    @('ADC_BasketNarrowW',          'in', '4',      '4x4 wire basket (Level 4-2)'),
    @('ADC_BasketNarrowH',          'in', '4',      ''),
    @('ADC_WMFPipeOffset',          'in', '3.00',   'Fig 18.5: 2X 3.00 WMF pipe spacing - VERIFY identity against figure before modeling'),
    @('ADC_WMFStackHeight',         'in', '8.62',   'Fig 18.5 Detail A dimension - VERIFY identity against figure before modeling'),
    @('ADC_WMFAssemblyWidth',       'in', '45.25',  'Fig 18.5 Detail A dimension - VERIFY identity against figure before modeling'),
    @('ADC_WMFDetailOffset',        'in', '5.25',   'Fig 18.5 Detail A dimension - VERIFY identity against figure before modeling'),
    # fungible / pattern parameters
    @('ADC_BelowFloorExtension',    'in', '48.25',  'FUNGIBLE - raised-floor extension columns, owner domain (Fig 18.4 default)'),
    @('ADC_RacksPerSidePerBay',     '',   '4',      'Pattern count - Redmond bay'),
    @('ADC_BaysPerRow',             '',   '4',      'Pattern count - 46 ft Reference Bay row (FUNGIBLE for longer rows)'),
    @('ADC_HangersPerPost',         '',   '3',      'Typ. 3 tray hangers per post (Levels 2-4)')
)

# --- CSV (ParameterIO add-in: Name,Unit,Expression,Comment) ---
$csv = @('Name,Unit,Expression,Comment')
foreach ($p in $params) {
    $comment = $p[3] -replace '"', "'"
    $csv += ('{0},{1},{2},"{3}"' -f $p[0], $p[1], $p[2], $comment)
}
[System.IO.File]::WriteAllText((Join-Path $out 'adc-hac-bay-params.csv'), ($csv -join "`r`n") + "`r`n")

# --- native Fusion 360 script (Scripts and Add-Ins > create > paste > Run) ---
$pyRows = @()
foreach ($p in $params) {
    $pyRows += ('    ("{0}", "{1}", "{2}", "{3}"),' -f $p[0], $p[1], $p[2], ($p[3] -replace '"', "'"))
}
$py = @"
# ADC HAC repeatable bay -- user parameters (HAC-OI-05)
# Generated from the ADC-SYS-001 registry by build-hac-fusion-params.ps1.
# Run inside Fusion 360: Utilities > Add-Ins > Scripts, create a new Python
# script, replace its contents with this file, Run with a design open.
# Creates or updates parameters idempotently; CRITICAL ones must not be
# altered -- they are the OCP Redmond interface.

import adsk.core, adsk.fusion, traceback

PARAMS = [
$($pyRows -join "`n")
]

def run(context):
    ui = None
    try:
        app = adsk.core.Application.get()
        ui = app.userInterface
        design = adsk.fusion.Design.cast(app.activeProduct)
        if not design:
            ui.messageBox('Open a Fusion design first, then run this script.')
            return
        ups = design.userParameters
        created = 0
        updated = 0
        for name, unit, expr, comment in PARAMS:
            expression = expr if unit == '' else (expr + ' ' + unit)
            existing = ups.itemByName(name)
            if existing:
                existing.expression = expression
                existing.comment = comment
                updated += 1
            else:
                ups.add(name, adsk.core.ValueInput.createByString(expression), unit, comment)
                created += 1
        ui.messageBox('ADC HAC bay parameters: {} created, {} updated.\n'
                      'CRITICAL parameters are the OCP Redmond interface -- do not alter.'.format(created, updated))
    except:
        if ui:
            ui.messageBox('Failed:\n{}'.format(traceback.format_exc()))
"@
[System.IO.File]::WriteAllText((Join-Path $out 'create_adc_hac_parameters.py'), $py)

Write-Output ("Wrote {0} parameters to adc-hac-bay-params.csv and create_adc_hac_parameters.py in {1}" -f $params.Count, $out)
