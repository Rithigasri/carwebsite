// terraform/variables.tf

variable "jenkins_port" {
  description = "The port on which Jenkins will run"
  type        = number
  default     = 8080
}

variable "sonarqube_port" {
  description = "The port on which SonarQube will run"
  type        = number
  default     = 9000
}
