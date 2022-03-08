########################################################################################################################
### Reference alb module
########################################################################################################################
module "aws_alb" {
  source                    = "./modules/aws/alb"
  set_username_prefix       = var.set_username_prefix
  set_alb_name              = var.set_alb_name
  set_alb_target_group_name = var.set_alb_target_group_name
  set_alb_listener_name     = var.set_alb_listener_name
}

# ########################################################################################################################
# ### Reference ecs module
# ########################################################################################################################
module "aws_ecs" {
  source                      = "./modules/aws/ecs"
  set_username_prefix         = var.set_username_prefix
  set_ecs_cluster_name        = var.set_ecs_cluster_name
  set_ecs_task_name           = var.set_ecs_task_name
  set_ecs_task_cpu            = var.set_ecs_task_cpu
  set_ecs_task_mem            = var.set_ecs_task_mem
  set_ecs_task_container_port = var.set_ecs_task_container_port
  set_ecs_log_group_name      = var.set_ecs_log_group_name
  set_ecs_log_group_region    = var.set_ecs_log_group_region
  set_ecr_image_tag           = var.set_ecr_image_tag
  get_alb_arn                 = module.aws_alb.alb_arn
  get_alb_tg_arn              = module.aws_alb.alb_target_group_arn
}
