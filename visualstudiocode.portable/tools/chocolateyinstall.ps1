# IMPORTANT: Before releasing this package, copy/paste the next 2 lines into PowerShell to remove all comments from this file:
#   $f='c:\path\to\thisFile.ps1'
#   gc $f | ? {$_ -notmatch "^\s*#"} | % {$_ -replace '(^.*?)\s*?[^``]#.*','$1'} | Out-File $f+".~" -en utf8; mv -fo $f+".~" $f

$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName= 'visualstudiocode.portable' # arbitrary name for the package, used in messages
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/Microsoft/vscode/archive/release/1.9.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  url64bit      = $url64
  #file         = $fileLocation
  # e.g. checksum -t sha256 -f path\to\file
  checksum      = '4F108C8F1296233A516A6584DDCD3E7EC1CDC0A062FE1158307D110C9EC204D5'
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
  checksum64    = ''
  checksumType64= 'sha256' #default is checksumType
}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
#Install-ChocolateyZipPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-zip-package

##PORTABLE EXAMPLE
#$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
# despite the name "Install-ChocolateyZipPackage" this also works with 7z archives
#Install-ChocolateyZipPackage $packageName $url $toolsDir $url64
## END PORTABLE EXAMPLE