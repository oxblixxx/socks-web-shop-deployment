module "Eks infrastructure" {
    source = "../jenkins-pipeline-modules/infrastructure"
    vpc_cidr_block = "10.10.0.0/28"
    private_subnet_cidr_blocks =  "10.10.0.0/29"
    public_subnet_cidr_blocks =   "10.10.0.16/29"
}