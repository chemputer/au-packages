$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://image.easyeda.com/files/easyeda-windows-ia32-6.4.20.6.exe'
$url64      = 'https://image.easyeda.com/files/easyeda-windows-x64-6.4.20.6.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'EasyEDA Desktop*'

  checksum      = 'a89fd92a105d5f8cc71a858b3fd428516e828b54c1614778ea2187eb7bfd289d'
  checksumType  = 'sha256'
  checksum64    = '61295632e216049f7f4488abec62784a32aac158c4b68f0e3050df6cb262faac'
  checksumType64= 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs










    








