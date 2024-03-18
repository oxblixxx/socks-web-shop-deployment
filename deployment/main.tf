module "eks-infrastructure" {
    source = "../socks-infra-pipeline-modules/deployment"
    AWS_ACCESS_KEY_ID =  var.AWS_ACCESS_KEY_ID
    AWS_SECRET_KEY_ID =  var.AWS_SECRET_KEY_ID
}

provider "aws" {
    access_key = var.AWS_ACCESS_KEY_ID
    secret_key = var.AWS_SECRET_KEY_ID
}