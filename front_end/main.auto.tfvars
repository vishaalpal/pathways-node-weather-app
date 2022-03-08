########################################################################################################################
### aws_alb module variable values
########################################################################################################################
set_username_prefix   = "vishaalpal"
alb_name              = "weather-app-alb"
alb_target_group_name = "weather-app-tg"
alb_listener_name     = "weather-app-listener"

########################################################################################################################
### aws_ecs module variable values
########################################################################################################################
ecs_cluster_name        = "weather-app-cluster"
ecs_task_name           = "weather-app-fam"
ecs_task_cpu            = 256
ecs_task_mem            = 512
ecs_task_container_port = 3000
ecr_image_tag           = "latest"
ecs_log_group_name      = "weather-app-fam-ecs-container-logs"
ecs_log_group_region    = "eu-west-1"
