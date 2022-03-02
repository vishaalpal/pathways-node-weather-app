########################################################################################################################
### Reference the network module
########################################################################################################################
module "aws_vpc" {
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
module "aws_s3" {
  source                  = "./modules/aws/s3"
  bucket                  = var.bucket
  set_custom_tags         = var.set_custom_tags
  set_s3_gateway_endpoint = var.set_s3_gateway_endpoint
  vpc_id                  = module.aws_vpc.vpc_id
  public_route_table_ids  = module.aws_vpc.public_route_table_ids
  private_route_table_ids = module.aws_vpc.private_route_table_ids
}