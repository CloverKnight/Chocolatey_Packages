$ErrorActionPreference = 'Stop';

$pp                = Get-PackageParameters
$packageName       = 'nodejs.portable'
$zipPath           = Join-Path $(Split-Path $MyInvocation.MyCommand.Path) 'node-v6.11.1-win-x86.zip'
$zipPath64         = Join-Path $(Split-Path $MyInvocation.MyCommand.Path) 'node-v6.11.1-win-x64.zip'
$unzipDir 		     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

if($pp["InstallationPath"]) { $unzipDir = $pp["InstallationPath"] }

$packageArgs = @{
  packageName    = $packageName
  destination    = $unzipDir
  fileFullPath   = $zipPath
  fileFullPath64 = $zipPath64
}

Get-ChocolateyUnzip @packageArgs