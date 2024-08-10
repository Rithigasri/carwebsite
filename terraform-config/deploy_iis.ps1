# PowerShell script to configure IIS
Import-Module WebAdministration

if (-not (Test-Path "C:\\inetpub\\wwwroot\\website")) {
    New-Item -Path "C:\\inetpub\\wwwroot\\website" -ItemType Directory
}

# Other IIS configurations here...
New-WebSite -Name "website" -Port 80 -PhysicalPath "C:\\inetpub\\wwwroot\\website" -Force
