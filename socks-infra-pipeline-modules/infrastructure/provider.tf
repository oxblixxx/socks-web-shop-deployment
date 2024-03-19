provider "aws" {
  region = "us-west-2"
  # other provider settings here
}



provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks_cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster.certificate_authority[0].data)
  #load_config_file = false
  token = data.aws_aws_eks_cluster_auth.cluster_auth
  #exec {
  #  api_version = "client.authentication.k8s.io/v1beta1"
  #  args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.eks_cluster.id]
  #  command     = "aws"
  #}
}


# data "aws_eks_cluster" "eks-cluster" {
#   name = "cluster_name"
# }

# terraform {
#   required_providers {
#     kubectl = {
#       source = "gavinbunney/kubectl"
#       version = "1.14.0"
#     }
#   }
# }



# provider "kubernetes" {
#   host                   = data.aws_eks_cluster.eks-cluster.endpoint
#   cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks-cluster.certificate_authority[0].data)
#   # version          = "2.16.1"

#   exec {
#     api_version = "client.authentication.k8s.io/v1alpha1"
#     args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.eks-cluster.name]
#     command     = "aws"
#   }
# }

# # Kubectl provider configuration




# provider "kubectl" {
#   host                   = data.aws_eks_cluster.eks-cluster.endpoint
#   cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks-cluster.certificate_authority[0].data)
#   exec {
#     api_version = "client.authentication.k8s.io/v1alpha1"
#     args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.eks-cluster.name]
#     command     = "aws"
#   }
# }
