########################################################################################################################
### Reference the aws_vpc module
########################################################################################################################
module "aws_vpc" {
  source                 = "terraform-aws-modules/vpc/aws"
  tags                   = var.set_custom_tags
  name                   = var.set_username_prefix
  cidr                   = var.set_vpc_cidr_range
  private_subnets        = var.set_private_subnets_cidr
  private_subnet_tags    = var.set_private_subnet_tags
  public_subnets         = var.set_public_subnets_cidr
  public_subnet_tags     = var.set_public_subnet_tags
  azs                    = var.set_azs
  create_igw             = var.create_igw
  enable_nat_gateway     = var.enable_nat_gateway
  one_nat_gateway_per_az = var.create_nat_gateway_per_az
}

########################################################################################################################
### Reference the aws_s3 module
########################################################################################################################
module "aws_s3" {
  source             = "./modules/aws/s3"
  set_custom_tags    = var.set_custom_tags
  set_s3_bucket_name = var.set_s3_bucket_name
}

########################################################################################################################
### Reference the aws_vpc_endpoints module
########################################################################################################################
module "aws_vpc_endpoints" {
  source                      = "./modules/aws/vpc_endpoints"
  set_custom_tags             = var.set_custom_tags
  set_ecr_bucket_arn          = var.set_ecr_bucket_arn
  set_s3_gateway_endpoint     = var.set_s3_gateway_endpoint
  set_cw_gateway_endpoint     = var.set_cw_gateway_endpoint
  get_s3_bucket_arn           = module.aws_s3.s3_bucket_name_arn
  get_vpc_id                  = module.aws_vpc.vpc_id
  get_vpc_cidr_block          = module.aws_vpc.vpc_cidr_block
  get_public_route_table_ids  = module.aws_vpc.public_route_table_ids
  get_private_route_table_ids = module.aws_vpc.private_route_table_ids
}
