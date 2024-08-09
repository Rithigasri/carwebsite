provider "local" {
  # Local provider for Terraform
}

resource "local_file" "jenkins_pipeline_script" {
  content = <<-EOT
    pipeline {
        agent any

        stages {
            stage('Checkout') {
                steps {
                    bat 'git clone https://github.com/Rithigasri/carwebsite.git'
                }
            }

            stage('Build') {
                steps {
                    // Replace with your build commands, e.g., mvn clean install for Maven projects
                    bat 'echo Building project...'
                }
            }

            stage('Deploy') {
                steps {
                    // Deployment commands, e.g., copying files to a web server directory
                    bat 'echo Deploying project...'
                }
            }

            stage('Health Check') {
                steps {
                    bat '''
                        FOR /F "tokens=*" %%i IN ('curl -o NUL -s -w "%%{http_code}" http://localhost:8080') DO SET STATUS=%%i
                        IF NOT "%STATUS%" == "200" (
                            echo Website is down! Status code: %STATUS%
                            exit 1
                        ) ELSE (
                            echo Website is up and running!
                        )
                    '''
                }
            }
        }
    }
  EOT

  filename = "jenkins_pipeline.groovy"
}

resource "null_resource" "jenkins_job" {
  provisioner "local-exec" {
    command = <<-EOT
      # Use Jenkins CLI to create a job with the above pipeline script
      java -jar /path/to/jenkins-cli.jar -s http://localhost:8080/ create-job "MyGitHubJob" < jenkins_pipeline.groovy
    EOT
  }

  depends_on = [local_file.jenkins_pipeline_script]
}
