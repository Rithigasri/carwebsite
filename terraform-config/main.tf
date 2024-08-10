provider "local" {
  
}

resource "iis_website" "MyStaticSite" {
  name = "website"
  physical_path = "C:\\inetpub\\wwwroot\\website"
  port = 80
  hostname = "localhost"
}
