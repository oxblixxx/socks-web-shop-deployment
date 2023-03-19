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


variable "vpc_cidr_block" {}
variable "private_subnet_cidr_blocks" {}
variable "public_subnet_cidr_blocks" {}