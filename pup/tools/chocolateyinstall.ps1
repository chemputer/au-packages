$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  File = "$toolsDir/pup_v0.4.0_windows_386.zip"
  File64 = "$toolsDir/pup_v0.4.0_windows_amd64.zip"

  softwareName  = 'pup*' 
    checksum      = '01acae220b69fb1ba8477d0e7f4d7669ef5de147966dc819cf75a845af74c5f3'
  checksumType  = 'sha256'
  checksum64    = '6755cbd43e94eaf173689e93e914c7056a2249c2977e5b90024fb397f9b45ba4'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs










    








