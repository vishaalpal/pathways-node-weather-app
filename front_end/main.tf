########################################################################################################################
### Reference alb module
########################################################################################################################
module "aws_alb" {
  source                = "./modules/aws/alb"
  set_username_prefix   = var.set_username_prefix
  alb_name              = var.alb_name
  alb_target_group_name = var.alb_target_group_name
  alb_listener_name     = var.alb_listener_name
}

# ########################################################################################################################
# ### Reference ecs module
# ########################################################################################################################
module "aws_ecs" {
  source                  = "./modules/aws/ecs"
  set_username_prefix     = var.set_username_prefix
  ecs_cluster_name        = var.ecs_cluster_name
  ecs_task_name           = var.ecs_task_name
  ecs_task_cpu            = var.ecs_task_cpu
  ecs_task_mem            = var.ecs_task_mem
  ecs_task_container_port = var.ecs_task_container_port
  ecr_image_tag           = var.ecr_image_tag
  alb_arn                 = module.aws_alb.alb_arn
  alb_tg_arn              = module.aws_alb.alb_target_group_arn
  ecs_log_group_name      = var.ecs_log_group_name
  ecs_log_group_region    = var.ecs_log_group_region
}
