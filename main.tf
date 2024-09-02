module "jenkins" {
  source = "./modules/jenkins"

  jenkins_home = var.jenkins_home
  jenkins_port = var.jenkins_port
}

module "sonarqube" {
  source = "./modules/sonarqube"

  sonarqube_home = var.sonarqube_home
  sonarqube_port = var.sonarqube_port
}