module "eks-infrastructure" {
    source = "../socks-infra-pipeline-modules/deployment"
}

provider "aws" {
    access_key = vaar.AWS_ACCESS_KEY_ID
    secret_key = var.AWS_SECRET_KEY_ID
}