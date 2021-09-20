import-module au
$releases = "https://easyeda.com/page/download"





function global:au_SearchReplace {

    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*url64\s*=\s*)('.*')"        = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*softwareName\s*=\s*)('.*')" = "`$1'$($Latest.softwareName)'"
        }
        ".\tools\chocolateyUninstall.ps1" = @{
            "(?i)(^\s*[$]softwareNamePattern\s*=\s*)('.*')" = "`$1'$($Latest.softwareName)'"
        }
        }
    }



function global:au_BeforeUpdate { 
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32 
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
    }

function global:au_GetLatest {
     $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing #1
     $regex   = '.exe$'
     $url     = $download_page.links | ? href -match $regex | select -First 1 -expand href #2
     $url64     = $download_page.links | ? href -match $regex | select -First 2 -Skip 1 -expand href #2
     $version = $url -split '-|.exe' | select -Last 1 -Skip 1 #3
     $SoftwareName = "EasyEDA Desktop"
     $PackageName = "easyeda"
     return @{ Version = $version; URL32 = $url; URL64 = $url64 }
}

update -Force 