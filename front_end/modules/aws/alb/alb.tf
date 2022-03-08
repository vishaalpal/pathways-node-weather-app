########################################################################################################################
# Define variables
########################################################################################################################
variable "set_alb_name" {}
variable "set_alb_target_group_name" {}
variable "set_alb_listener_name" {}
variable "set_username_prefix" {}

########################################################################################################################
### Create resources
########################################################################################################################
data "aws_vpc" "vpc_id" {
  filter {
    name   = "tag:Name"
    values = ["vishaalpal"]
  }
}

data "aws_subnet_ids" "filtered_public_subnets" {
  vpc_id = data.aws_vpc.vpc_id.id

  filter {
    name   = "availabilityZone"
    values = ["eu-west-1a", "eu-west-1b"]
  }
  tags = {
    Public = "true"
  }
}

data "aws_subnet" "public_subnets" {
  for_each = data.aws_subnet_ids.filtered_public_subnets.ids
  id       = each.value
}

data "aws_security_group" "alb_sg_id" {
  vpc_id = data.aws_vpc.vpc_id.id
  name   = "${var.set_username_prefix}-weather-app-alb-sg"
}

resource "aws_alb_target_group" "alb_tg" {
  name        = "${var.set_username_prefix}-${var.set_alb_target_group_name}"
  port        = 3000
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = data.aws_vpc.vpc_id.id
  tags = {
    Name = "${var.set_username_prefix} - ${var.set_alb_target_group_name}"
  }
}

resource "aws_alb" "alb" {
  name                       = "${var.set_username_prefix}-${var.set_alb_name}"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [data.aws_security_group.alb_sg_id.id]
  enable_deletion_protection = false
  subnets                    = [for s in data.aws_subnet.public_subnets : s.id]
  tags = {
    Name = "${var.set_username_prefix} - ${var.set_alb_name}"
  }
}

resource "aws_alb_listener" "alb_listener" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.alb_tg.arn
  }
  tags = {
    Name = "${var.set_username_prefix} - ${var.set_alb_listener_name}"
  }
}

########################################################################################################################
### Define outputs
########################################################################################################################
output "alb_arn" {
  description = "The ARN of the load balancer"
  value       = aws_alb.alb.arn
}

output "alb_fqdn" {
  description = "The DNS name of the load balancer"
  value       = aws_alb.alb.dns_name
}

output "alb_target_group_arn" {
  description = "ARN of the Target Group"
  value       = aws_alb_target_group.alb_tg.arn
}
