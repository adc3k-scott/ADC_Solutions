# ADC executable twin -- minimal Redfish HTTP server.
# Serves the mockup tree built by build-redfish-tree.ps1 at
# http://localhost:<Port>/redfish/v1/... GET-only, zero dependencies.
# -RequestLimit N exits after N requests (handy for scripted tests);
# 0 = run until the process is stopped.

param([int]$Port = 8910, [int]$RequestLimit = 0)
$ErrorActionPreference = 'Stop'
$root = Join-Path $PSScriptRoot '..\redfish'
if (-not (Test-Path (Join-Path $root 'redfish\v1\index.json'))) {
    throw "Mockup tree not found. Run build-redfish-tree.ps1 first."
}

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$Port/")
$listener.Start()
Write-Output ("ADC twin Redfish service: http://localhost:{0}/redfish/v1  (GET only; Ctrl+C or -RequestLimit to stop)" -f $Port)

$served = 0
try {
    while ($true) {
        $ctx = $listener.GetContext()
        $req = $ctx.Request; $res = $ctx.Response
        $res.Headers.Add('OData-Version', '4.0')
        $res.Headers.Add('Cache-Control', 'no-store')
        $body = $null; $code = 200
        if ($req.HttpMethod -ne 'GET') {
            $code = 405
            $body = '{"error":{"code":"Base.1.0.GeneralError","message":"This twin is read-only (POC Phase 1). Setpoint requests belong to Layer-1 controllers."}}'
        } else {
            $rel = $req.Url.AbsolutePath.Trim('/') -replace '/', '\'
            if ($rel -eq '') { $rel = 'redfish\v1' }
            $file = Join-Path $root (Join-Path $rel 'index.json')
            # containment check: resolved path must stay inside the tree
            $full = [System.IO.Path]::GetFullPath($file)
            if (-not $full.StartsWith([System.IO.Path]::GetFullPath($root))) { $code = 404 }
            elseif (Test-Path $full) { $body = [System.IO.File]::ReadAllText($full) }
            else { $code = 404 }
            if ($code -eq 404) {
                $body = '{"error":{"code":"Base.1.0.ResourceMissingAtURI","message":"Resource not found: ' + $req.Url.AbsolutePath + '"}}'
            }
        }
        $bytes = [System.Text.Encoding]::UTF8.GetBytes($body)
        $res.StatusCode = $code
        $res.ContentType = 'application/json; charset=utf-8'
        $res.ContentLength64 = $bytes.Length
        $res.OutputStream.Write($bytes, 0, $bytes.Length)
        $res.Close()
        $served++
        if ($RequestLimit -gt 0 -and $served -ge $RequestLimit) { break }
    }
} finally {
    $listener.Stop()
    Write-Output ("Served {0} requests. Listener stopped." -f $served)
}
