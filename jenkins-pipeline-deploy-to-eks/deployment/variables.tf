variable "mysql-password" {
  type        = string
  description = "name of the docker image to deploy"
  default     = "general"
}

variable "docker-image" {
  type        = string
  description = "docker image"
  default     = "oxblixxx/web"
}

# variable "create_kms_alias" {
#   type    = bool
#   default = true
# }