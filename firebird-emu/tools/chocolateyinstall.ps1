
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/nspire-emus/firebird/releases/download/v1.5/firebird-windows.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'firebird-emu*'

  checksum      = 'DA127B5470B9A1B9DC8B0FBC9AF62FD34A7B4D884F6BB1503E93C41C5A9E7701'
  checksumType  = 'sha256'

}

Install-ChocolateyZipPackage @packageArgs
