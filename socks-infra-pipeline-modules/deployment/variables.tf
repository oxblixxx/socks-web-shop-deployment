variable "mysql-password" {
  type        = string
  description = "Password to login"
  default     = "general"
}

variable "docker-image" {
  type        = string
  description = "docker image"
  default     = "oxblixxx/web"
}


variable "AWS_ACCESS_KEY_ID" {
  
}

variable "AWS_SECRET_KEY_ID" {
  
}
