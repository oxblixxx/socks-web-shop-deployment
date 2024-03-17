terraform {
     backend "s3" {
     bucket = "socks-webshop-oxblixxx-project"
     region = "us-west-2"
     key = "deployment/terraform.tfstate"
   }
}