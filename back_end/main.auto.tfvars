########################################################################################################################
### Tag variable values
########################################################################################################################
set_username_prefix = "vishaalpal"
set_custom_tags = {
  Student_Name = "Vishaal Pal"
  Project_Name = "pathways-node-weather-app"
  Pathway      = "Contino Infrastructure Engineer to Cloud Engineer Pathway"
}

########################################################################################################################
### aws_ecr module variable values
########################################################################################################################
set_ecr_repo_name = "node-weather-app"

########################################################################################################################
### aws_iam module variable values
########################################################################################################################

########################################################################################################################
### aws_sg module variable values
########################################################################################################################
set_alb_sg_name        = "weather-app-alb-sg"
set_alb_sg_description = "Allow incoming HTTP traffic from ALL"
set_alb_sg_ingress_rules = [{
  from     = 80
  to       = 80
  protocol = "tcp"
  cidr     = ["0.0.0.0/0"]
}]
set_alb_sg_egress_rules = [{
  from     = 0
  to       = 0
  protocol = "-1"
  cidr     = ["0.0.0.0/0"]
}]
set_ecs_sg_name        = "weather-app-ecs-sg"
set_ecs_sg_description = "Allow incoming HTTP traffic from the ALB"
set_ecs_sg_egress_rules = [{
  from     = 0
  to       = 0
  protocol = "-1"
  cidr     = ["0.0.0.0/0"]
}]
