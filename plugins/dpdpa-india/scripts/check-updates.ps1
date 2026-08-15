<#
.SYNOPSIS
  Check whether the dpdpa-india skill's upstream legal sources have changed (native PowerShell, no Python needed).
.DESCRIPTION
  Re-fetches every source pinned in sources.lock.json. Stable files are compared by SHA-256.
  Pages behind a nondeterministic JavaScript challenge are checked for reachability and require manual review.
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
  $row = [ordered]@{ id = $s.id; label = $s.label; url = $s.url; type = $s.type; check = ""; old = $s.sha256; new = $null; status = ""; error = "" }
  try {
    if ($s.check -eq "reachable") {
      $row.check = "reachable"
      Invoke-WebRequest -Uri $s.url -UseBasicParsing -UserAgent $ua -TimeoutSec 45 | Out-Null
      $row.status = "OK"
    } else {
      $row.check = "sha256"
      $live = Get-RemoteSha256 $s.url
      $row.new = $live
      if (-not $s.sha256) { $row.status = "BASELINE" }
      elseif ($live -eq $s.sha256.ToLower()) { $row.status = "OK" }
      else { $row.status = "CHANGED" }
      if ($Update) { $s.sha256 = $live }
    }
  } catch { $row.status = "ERROR"; $row.error = $_.Exception.Message }
  $results += [pscustomobject]$row
}

$changed = @($results | Where-Object { $_.status -eq "CHANGED" })
$errored = @($results | Where-Object { $_.status -eq "ERROR" })

if ($Update -and -not $errored.Count) {
  $lock.verified = (Get-Date -Format "yyyy-MM-dd")
  $jsonText = ($lock | ConvertTo-Json -Depth 6) + "`n"
  [System.IO.File]::WriteAllText($lockPath, $jsonText, (New-Object System.Text.UTF8Encoding($false)))
}

if ($Json) {
  [pscustomobject]@{ verified = $lock.verified; results = $results; changed = $changed.Count; errors = $errored.Count } | ConvertTo-Json -Depth 6
  if ($errored.Count) { exit 2 }
  if ($changed.Count -and -not $Update) { exit 1 }
  exit 0
}

Write-Host "DPDP source check - baseline verified $($lock.verified)`n"
foreach ($r in $results) {
  $color = switch ($r.status) { "OK" {"Green"} "CHANGED" {"Red"} "ERROR" {"Yellow"} default {"DarkGray"} }
  Write-Host ("  {0,-9} {1,-24} {2}" -f $r.status, $r.id, $r.url) -ForegroundColor $color
  if ($r.status -eq "ERROR") { Write-Host "            $($r.error)" -ForegroundColor DarkGray }
}
Write-Host ""
if ($Update -and $errored.Count) {
  Write-Host "Lock file not changed because one or more sources could not be fetched." -ForegroundColor Red
} elseif ($Update) {
  Write-Host "Lock file re-pinned to current hashes. Reachability checks were left unchanged." -ForegroundColor Green
} elseif ($changed.Count) {
  Write-Host "$($changed.Count) source(s) CHANGED - re-verify the affected reference files:" -ForegroundColor Red
  foreach ($r in $changed) {
    $feeds = ($lock.sources | Where-Object { $_.id -eq $r.id }).feeds
    Write-Host "    - $($r.id)  ->  $feeds"
  }
  Write-Host "  Re-verify against the source, update the .md files, then run with -Update."
} elseif ($errored.Count) {
  Write-Host "$($errored.Count) source(s) could not be checked. Currentness is unknown." -ForegroundColor Yellow
} else {
  Write-Host "All sources current." -ForegroundColor Green
}
if ($errored.Count) { exit 2 }
if ($changed.Count -and -not $Update) { exit 1 }
exit 0
