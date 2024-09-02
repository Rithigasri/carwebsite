resource "null_resource" "jenkins" {
  provisioner "local-exec" {
    command = <<-EOT
      cd C:\\ProgramData\\Jenkins
      java -jar jenkins.war --httpPort=8080
    EOT
  }
}
