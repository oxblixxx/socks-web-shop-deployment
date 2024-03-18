module "eks-infrastructure" {
    source = "../socks-infra-pipeline-modules/deployment"
    AWS_ACCESS_KEY_ID =  var.AWS_ACCESS_KEY_ID
    AWS_SECRET_KEY =  var.AWS_SECRET_KEY
}

provider "aws" {
    access_key = var.AWS_ACCESS_KEY_ID
    secret_key = var.AWS_SECRET_KEY
}