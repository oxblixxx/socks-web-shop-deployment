data "aws_availability_zones" "azs" {}

module "myapp-vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.6.0"
  name = "my-vpc"
  cidr = "10.10.0.0/28"

  azs             = ["us-west-2a", "us-west-2b"]
  private_subnets = ["10.10.0.0/29"]
  public_subnets  = ["10.10.0.16/29"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

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