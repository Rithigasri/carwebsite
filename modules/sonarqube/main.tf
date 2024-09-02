resource "null_resource" "sonarqube" {
  provisioner "local-exec" {
    command = <<-EOT
      cd C:\\Users\\Rithigasri\\Downloads\\sonarqube-10.6.0.92116\\sonarqube-10.6.0.92116
      java -jar sonarqube.jar -Dsonar.web.port=9000
    EOT
  }
}
