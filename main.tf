########################################################################################################################
### Reference the network module
########################################################################################################################
module "network" {
  source                 = "terraform-aws-modules/vpc/aws"
  name                   = var.set_username_prefix
  cidr                   = var.set_vpc_cidr_range
  private_subnets        = var.create_private_subnets
  public_subnets         = var.create_public_subnets
  azs                    = var.get_azs
  create_igw             = var.create_igw
  enable_nat_gateway     = var.enable_nat_gateway
  one_nat_gateway_per_az = var.create_nat_gateway_per_az
  tags                   = var.set_custom_tags
}

########################################################################################################################
### Reference the s3_bucket module
########################################################################################################################
module "s3_bucket" {
  source                  = "./modules/s3"
  bucket                  = var.bucket
  tags                    = var.set_custom_tags
  vpc_id                  = module.network.vpc_id
  set_s3_gateway_endpoint = var.set_s3_gateway_endpoint
}
