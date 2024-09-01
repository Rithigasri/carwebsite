// terraform/modules/jenkins/main.tf

resource "null_resource" "jenkins_setup" {
  provisioner "local-exec" {
    command = <<EOT
      echo "Setting up Jenkins..."
      # Add commands to configure Jenkins if needed
    EOT
  }
}
