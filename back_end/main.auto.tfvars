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
alb_sg_name        = "weather-app-alb-sg"
alb_sg_description = "Allow incoming HTTP traffic from ALL"
alb_ingress_rules = [{
  from     = 80
  to       = 80
  protocol = "tcp"
  cidr     = ["0.0.0.0/0"]
}]
alb_egress_rules = [{
  from     = 0
  to       = 0
  protocol = "-1"
  cidr     = ["0.0.0.0/0"]
}]
ecs_sg_name        = "weather-app-ecs-sg"
ecs_sg_description = "Allow incoming HTTP traffic from the ALB"
ecs_egress_rules = [{
  from     = 0
  to       = 0
  protocol = "-1"
  cidr     = ["0.0.0.0/0"]
}]
