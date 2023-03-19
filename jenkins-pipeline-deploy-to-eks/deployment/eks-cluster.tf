module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "~> 19.0"
    cluster_name = "socks-web-shop"
    cluster_version = "1.24"

    cluster_endpoint_public_access  = true

    vpc_id = module.socks-vpc.vpc_id
    subnet_ids = module.socks-vpc.public_subnets

    tags = {
        environment = "development"
        application = "myapp"
    }

    eks_managed_node_groups = {
        dev = {
            min_size = 1
            max_size = 3
            desired_size = 2

            instance_types = ["t2.xlarge"]
        }
    }

   
}

resource "null_resource" "kms_alias_dependency" {
  count = 0
  depends_on = [module.eks.kms_alias]
}




# resource "kubernetes_namespace" "sock-shop" {
#   metadata {
#     name = "sock-shop"
#   }

#   lifecycle {
#     ignore_changes = [metadata]
#   }
# }

 output "eks-cluster" {
        value = module.eks.cluster_name
}
