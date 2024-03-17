data "aws_availability_zones" "azs" {}

module "myapp-vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.6.0"
  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-2a", "us-west-2b"]
  private_subnets = ["10.0.1.0/27"]
  public_subnets  = ["10.0.101.0/27", "10.0.102.0/27"]
  enable_nat_gateway = true
  map_public_ip_on_launch = true

  tags = {
    "kubernetes.io/cluster/socks-web-shop" = "shared"
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