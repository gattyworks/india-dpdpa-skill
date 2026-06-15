<#
.SYNOPSIS
  Check whether the dpdp-india skill's upstream legal sources have changed (native PowerShell, no Python needed).
.DESCRIPTION
  Re-fetches every source pinned in sources.lock.json, hashes it, and diffs against the stored hash.
.PARAMETER Update
  Re-pin current hashes into the lock file (after you have re-verified the reference files).
.PARAMETER Json
  Emit JSON instead of a table.
.EXAMPLE
  ./check-updates.ps1
  ./check-updates.ps1 -Update
#>
[CmdletBinding()]
param([switch]$Update, [switch]$Json)

$ErrorActionPreference = "Stop"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$lockPath = Join-Path $PSScriptRoot "sources.lock.json"
$ua = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36"
$lock = Get-Content -Raw -Encoding UTF8 $lockPath | ConvertFrom-Json

function Get-RemoteSha256([string]$url) {
  $tmp = [System.IO.Path]::GetTempFileName()
  try {
    Invoke-WebRequest -Uri $url -OutFile $tmp -UseBasicParsing -UserAgent $ua -TimeoutSec 45 | Out-Null
    return (Get-FileHash -Path $tmp -Algorithm SHA256).Hash.ToLower()
  } finally { Remove-Item $tmp -ErrorAction SilentlyContinue }
}

$results = @()
foreach ($s in $lock.sources) {
  $row = [ordered]@{ id = $s.id; url = $s.url; status = ""; error = "" }
  try {
    $live = Get-RemoteSha256 $s.url
    if (-not $s.sha256) { $row.status = "BASELINE" }
    elseif ($live -eq $s.sha256.ToLower()) { $row.status = "OK" }
    else { $row.status = "CHANGED" }
    if ($Update) { $s.sha256 = $live }
  } catch { $row.status = "ERROR"; $row.error = $_.Exception.Message }
  $results += [pscustomobject]$row
}

if ($Update) {
  $lock.verified = (Get-Date -Format "yyyy-MM-dd")
  ($lock | ConvertTo-Json -Depth 6) | Out-File -FilePath $lockPath -Encoding utf8
}

$changed = @($results | Where-Object { $_.status -eq "CHANGED" })
$errored = @($results | Where-Object { $_.status -eq "ERROR" })

if ($Json) {
  [pscustomobject]@{ verified = $lock.verified; results = $results; changed = $changed.Count; errors = $errored.Count } | ConvertTo-Json -Depth 6
  exit ($(if ($changed.Count) { 1 } else { 0 }))
}

Write-Host "DPDP source check - baseline verified $($lock.verified)`n"
foreach ($r in $results) {
  $color = switch ($r.status) { "OK" {"Green"} "CHANGED" {"Red"} "ERROR" {"Yellow"} default {"DarkGray"} }
  Write-Host ("  {0,-9} {1,-24} {2}" -f $r.status, $r.id, $r.url) -ForegroundColor $color
  if ($r.status -eq "ERROR") { Write-Host "            $($r.error)" -ForegroundColor DarkGray }
}
Write-Host ""
if ($Update) {
  Write-Host "Lock file re-pinned to current hashes." -ForegroundColor Green
} elseif ($changed.Count) {
  Write-Host "$($changed.Count) source(s) CHANGED - re-verify the affected reference files:" -ForegroundColor Red
  foreach ($r in $changed) {
    $feeds = ($lock.sources | Where-Object { $_.id -eq $r.id }).feeds
    Write-Host "    - $($r.id)  ->  $feeds"
  }
  Write-Host "  Re-verify against the source, update the .md files, then run with -Update."
} elseif ($errored.Count) {
  Write-Host "All reachable sources current; $($errored.Count) could not be fetched (retry / check network)." -ForegroundColor Yellow
} else {
  Write-Host "All sources current." -ForegroundColor Green
}
exit ($(if ($changed.Count) { 1 } else { 0 }))
