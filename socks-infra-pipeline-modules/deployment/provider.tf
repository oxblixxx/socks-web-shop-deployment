provider "aws" {
  region = "us-west-2"
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

data "aws_eks_cluster" "eks_cluster" {
    name = "socks-web-shop"
}

#data "aws_eks_cluster_auth" "cluster_auth" {
#    name = module.eks.cluster_name
#}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks-cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster.certificate_authority[0].data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.eks_cluster.name]
    command     = "aws"
  }
}

# Kubectl provider configuration
provider "kubectl" {
  host                   = data.aws_eks_cluster.eks-_cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster.certificate_authority[0].data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.eks_cluster.name]
    command     = "aws"
  }
}
