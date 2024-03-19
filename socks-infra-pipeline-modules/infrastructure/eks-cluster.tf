# https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest
module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "20.8.3"
    cluster_name = "socks-web-shop"
    cluster_version = "1.24"

    cluster_endpoint_public_access  = true
    vpc_id = module.myapp-vpc.vpc_id
    subnet_ids = [module.myapp-vpc.public_subnets[0], module.myapp-vpc.public_subnets[1]]

    tags = {
        environment = "development"
        application = "myapp"
    }

    eks_managed_node_groups = {
        dev = {
            min_size = 1
            max_size = 3
            desired_size = 3

            instance_types = ["t3.medium"]
        }
    }
    depends_on = [ module.myapp-vpc.public_subnets ]
   
}

data "aws_eks_cluster" "eks_cluster" {
    name = module.eks.cluster_name
}

#data "aws_eks_cluster_auth" "cluster_auth" {
#    name = module.eks.socks-web-shop
#}

 output "eks-cluster" {
        value = module.eks.cluster_name
}
