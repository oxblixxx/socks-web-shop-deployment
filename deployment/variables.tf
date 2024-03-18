variable "aws_access_key_id" {
  default = getenv("AWS_ACCESS_KEY_ID")
}

variable "aws_secret_key_id" {
  default = getenv("AWS_SECRET_KEY_ID")
}