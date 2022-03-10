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

########################################################################################################################
### Reference sg module
########################################################################################################################
module "aws_sg" {
  source                   = "./modules/aws/sg"
  set_username_prefix      = var.set_username_prefix
  set_alb_sg_name          = var.set_alb_sg_name
  set_alb_sg_description   = var.set_alb_sg_description
  set_alb_sg_ingress_rules = var.set_alb_sg_ingress_rules
  set_alb_sg_egress_rules  = var.set_alb_sg_egress_rules
  set_ecs_sg_name          = var.set_ecs_sg_name
  set_ecs_sg_description   = var.set_ecs_sg_description
  set_ecs_sg_egress_rules  = var.set_ecs_sg_egress_rules
}


