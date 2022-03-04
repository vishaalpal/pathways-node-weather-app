########################################################################################################################
### Reference ecr module
########################################################################################################################
module "aws_ecr" {
  source              = "./modules/aws/ecr"
  set_username_prefix = var.set_username_prefix
  set_custom_tags     = var.set_custom_tags
  set_ecr_repo_name   = var.set_ecr_repo_name
}

########################################################################################################################
### Reference iam module
########################################################################################################################
module "aws_iam" {
  source              = "./modules/aws/iam"
  set_username_prefix = var.set_username_prefix
}
