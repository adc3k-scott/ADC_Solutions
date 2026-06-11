# build-rfq-sheets.ps1 - render supplier-facing RFQ sheets from the cluster bundle CSVs.
# Source of truth: products/Cluster/rfq/*.csv (ADC-CLU-BOM-001). Output: ops/rfq/sheets/*.md
# Never hand-edit a generated sheet - change the CSV and re-run. PS 5.1, zero dependencies.
param(
    [string]$QuoteBy = "TBD - 5 to 10 business days from receipt requested"
)
$ErrorActionPreference = 'Stop'
$repo = Resolve-Path (Join-Path $PSScriptRoot '..\..')
$srcDir = Join-Path $repo 'products\Cluster\rfq'
$outDir = Join-Path $repo 'ops\rfq\sheets'
if (-not (Test-Path $outDir)) { New-Item -ItemType Directory -Path $outDir | Out-Null }

$today = Get-Date -Format 'yyyy-MM-dd'
$csvs = Get-ChildItem $srcDir -Filter *.csv | Sort-Object Name
if (-not $csvs) { Write-Output "No bundle CSVs found in $srcDir"; exit 1 }

foreach ($csv in $csvs) {
    $rows = Get-Content $csv.FullName -Raw -Encoding UTF8 | ConvertFrom-Csv
    $bundle = $csv.BaseName
    $lines = @()
    $lines += "# ADC Solutions Inc - Request for Quotation"
    $lines += ""
    $lines += "**Bundle $bundle** | Package ADC-CLU-BOM-001 Rev 0.1 (16-rack reference cluster) | Issued $today"
    $lines += ""
    $lines += "| | |"
    $lines += "|---|---|"
    $lines += "| Contact | Scott Tomsu, President - scott@adc3k.com - 337-780-1535 |"
    $lines += "| Mail | ADC Solutions Inc, PO Box 2224, Lafayette, LA 70502 |"
    $lines += "| Web | www.ADC3K.com |"
    $lines += "| Quote due | $QuoteBy |"
    $lines += ""
    $lines += "Quote against the performance specification. First-source part numbers indicate the"
    $lines += "design basis; equivalent alternates meeting the spec are welcome and should be quoted"
    $lines += "with full catalog data. Items tagged W or O carry working quantities - quote unit"
    $lines += "pricing so totals survive quantity changes. Delivery to Lafayette, LA unless noted."
    $lines += ""
    $lines += "| Item | Description | Qty | Unit | Performance specification | First source | Alternates | Notes |"
    $lines += "|---|---|---|---|---|---|---|---|"
    foreach ($r in $rows) {
        $desc = $r.description -replace '\|', '/'
        $spec = $r.spec -replace '\|', '/'
        $note = $r.notes -replace '\|', '/'
        $lines += "| $($r.item) | $desc | $($r.qty) | $($r.unit) | $spec | $($r.first_source) | $($r.alternates) | [$($r.tag)] $note |"
    }
    $lines += ""
    $lines += "*Generated from products/Cluster/rfq/$($csv.Name) by build-rfq-sheets.ps1 on $today. Do not edit this sheet directly.*"
    $outPath = Join-Path $outDir ($bundle + '.md')
    $lines -join "`r`n" | Out-File -FilePath $outPath -Encoding utf8
    Write-Output ("Wrote {0} ({1} items)" -f $outPath, @($rows).Count)
}
Write-Output "Done: $(@($csvs).Count) sheets."
