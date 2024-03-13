terraform {
  backend "s3" {
    bucket = "devops-project-2024-oxblixxx"
    region = "us-east-1"
    key = "socks-webs-shop-deployment/jenkins-server/terraform.tfstate"
  }
}