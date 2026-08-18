variable "aws_region" {
  description = "La région AWS pour le déploiement"
  type        = string
  default     = "eu-west-3" # Paris
}

variable "project_name" {
  description = "Le nom du projet"
  type        = string
  default     = "cloud-edge-infrastructure"
}

variable "environment" {
  description = "L'environnement de déploiement"
  type        = string
  default     = "dev"
}