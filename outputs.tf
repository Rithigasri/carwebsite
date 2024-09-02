output "jenkins_url" {
  value = "http://localhost:${module.jenkins.jenkins_port}"
}

output "sonarqube_url" {
  value = "http://localhost:${module.sonarqube.sonarqube_port}"
}
