provider "aws" {
  region = "us-west-2"
#  other provider settings here
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_KEY_ID
}


data "aws_eks_cluster" "eks-cluster" {
  name = "socks-web-shop"
}

terraform {
  required_providers {
    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}



provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks-cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks-cluster.certificate_authority[0].data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.eks-cluster.name]
    command     = "aws"
  }
}

# Kubectl provider configuration
