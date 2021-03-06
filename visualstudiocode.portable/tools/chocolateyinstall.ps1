﻿$ErrorActionPreference = 'Stop';

$pp                = Get-PackageParameters
$packageName       = 'visualstudiocode.portable'
$zipPath           = Join-Path $(Split-Path $MyInvocation.MyCommand.Path) 'VSCode-win32-ia32-1.14.2.zip'
$unzipDir 		     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

if($pp["InstallationPath"]) { $unzipDir = $pp["InstallationPath"] }

$packageArgs = @{
  packageName   = $packageName
  destination   = $unzipDir
  fileFullPath  = $zipPath
}

Get-ChocolateyUnzip @packageArgs