$ErrorActionPreference = 'Stop';

$pp                = Get-PackageParameters
$packageName       = 'nodejs.portable'
$unzipDir 		     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url32 = https://nodejs.org/dist/v6.10.2/node-v6.10.2-win-x86.zip 
$url64 = https://nodejs.org/dist/v6.10.2/node-v6.10.2-win-x64.zip 

if($pp["InstallationPath"]) { $unzipDir = $pp["InstallationPath"] }
        
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $unzipDir
  url           = $url32
  url64bit		  = $url64
}

Install-ChocolateyZipPackage @packageArgs