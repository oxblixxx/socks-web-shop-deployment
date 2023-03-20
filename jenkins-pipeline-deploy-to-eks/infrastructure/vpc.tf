data "aws_availability_zones" "azs" {}
module "socks-vpc" {
  source          = "terraform-aws-modules/vpc/aws"
  version         = "3.19.0"
  name            = "socks-vpc"
  cidr            = var.vpc_cidr_block
  private_subnets = var.private_subnet_cidr_blocks
  public_subnets  = var.public_subnet_cidr_blocks
  azs             = data.aws_availability_zones.azs.names

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = {
    "kubernetes.io/cluster/socks-web-shop" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/socks-web-shop" = "shared"
    "kubernetes.io/role/elb"                  = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/socks-web-shop" = "shared"
    "kubernetes.io/role/internal-elb"         = 1
  }
}


resource "aws_security_group" "eks-security-group" {
  name_prefix = "eks-security-group"
  description = "Security group for EKS cluster"
  vpc_id = module.socks-vpc.vpc_id

  ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# output "private_subnet_names" {
#   # value = module.myapp-vpc.private_subnets_names
#   value = module.myapp-vpc.private_subnets[*].id
# }

# output "public_subnet_ids" {
#   value = join(",", module.myapp-vpc.public_subnets[*].id)
# }


# output "public_subnet_ids" {
#   value = module.myapp-vpc.public_subnets_ids
# }