########################################################################################################################
### aws_alb module variable values
########################################################################################################################
set_username_prefix       = "vishaalpal"
set_alb_name              = "weather-app-alb"
set_alb_target_group_name = "weather-app-tg"
set_alb_listener_name     = "weather-app-listener"

########################################################################################################################
### aws_ecs module variable values
########################################################################################################################
set_ecs_cluster_name        = "weather-app-cluster"
set_ecs_task_name           = "weather-app-fam"
set_ecs_task_cpu            = 256
set_ecs_task_mem            = 512
set_ecs_task_container_port = 3000
set_ecr_image_tag           = "latest"
set_ecs_log_group_name      = "weather-app-fam-ecs-container-logs"
set_ecs_log_group_region    = "eu-west-1"
