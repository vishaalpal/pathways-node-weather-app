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
  source              = "./modules/aws/sg"
  set_username_prefix = var.set_username_prefix
  alb_sg_name         = var.alb_sg_name
  alb_sg_description  = var.alb_sg_description
  alb_ingress_rules   = var.alb_ingress_rules
  alb_egress_rules    = var.alb_egress_rules
  ecs_sg_name         = var.ecs_sg_name
  ecs_sg_description  = var.ecs_sg_description
  ecs_egress_rules    = var.ecs_egress_rules
}


