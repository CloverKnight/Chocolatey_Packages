$ErrorActionPreference = 'Stop'; # stop on all errors

$packageParameters = Get-PackageParameters
$packageName       = 'visualstudiocode.portable' # arbitrary name for the package, used in messages
$url               = 'https://github.com/Microsoft/vscode/archive/1.9.1.zip'
$unzipDir          = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

if ($packageParameters[InstallationPath])
{
	$unzipDir = $packageParameters[InstallationPath]
}
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $unzipDir
  url           = $url
  checksum      = '4F108C8F1296233A516A6584DDCD3E7EC1CDC0A062FE1158307D110C9EC204D5'
  checksumType  = 'sha256'

Install-ChocolateyZipPackage @packageArgs