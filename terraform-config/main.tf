terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "local" {}

resource "local_file" "deploy_iis" {
  content  = <<-EOF
    # PowerShell script to configure IIS
    Import-Module WebAdministration

    if (-not (Test-Path "C:\\inetpub\\wwwroot\\website")) {
        New-Item -Path "C:\\inetpub\\wwwroot\\website" -ItemType Directory
    }

    # Other IIS configurations here...
    New-WebSite -Name "website" -Port 80 -PhysicalPath "C:\\inetpub\\wwwroot\\website" -Force
    EOF
  filename = "${path.module}/deploy_iis.ps1"
}

resource "null_resource" "execute_powershell" {
  provisioner "local-exec" {
    command = "powershell.exe -ExecutionPolicy RemoteSigned -File ${local_file.deploy_iis.filename}"
  }

  depends_on = [local_file.deploy_iis]
}

