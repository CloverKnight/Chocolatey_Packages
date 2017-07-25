$ErrorActionPreference = 'Stop';

$pp                = Get-PackageParameters
$packageName       = 'electron.portable'
$zipPath           = Join-Path $(Split-Path $MyInvocation.MyCommand.Path) 'electron-v1.6.11-win32-ia32.zip'
$zipPath64         = Join-Path $(Split-Path $MyInvocation.MyCommand.Path) 'electron-v1.6.11-win32-x64.zip'
$unzipDir 		     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

if($pp["InstallationPath"]) { $unzipDir = $pp["InstallationPath"] }

$packageArgs = @{
  packageName    = $packageName
  destination    = $unzipDir
  fileFullPath   = $zipPath
  fileFullPath64 = $zipPath64
}

Get-ChocolateyUnzip @packageArgs