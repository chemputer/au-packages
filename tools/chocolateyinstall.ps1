$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://image.easyeda.com/files/easyeda-windows-ia32-6.4.19.4.exe'
$url64      = 'https://image.easyeda.com/files/easyeda-windows-x64-6.4.19.4.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'EasyEDA Desktop*'

  checksum      = '3fd3d8e5fe64898152ded023b198058389bfa83f6ac9a5bb6617a5365d532a51'
  checksumType  = 'sha256'
  checksum64    = 'ccf78e6abbe2aecdde7bc9c28cd78af1b4df4cc4220f0c23b450aa296c325db1'
  checksumType64= 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs










    








