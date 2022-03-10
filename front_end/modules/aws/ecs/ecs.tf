########################################################################################################################
# Define variables
########################################################################################################################
variable "set_username_prefix" {}
variable "set_ecs_cluster_name" {}
variable "set_ecs_task_name" {}
variable "set_ecs_task_cpu" {}
variable "set_ecs_task_mem" {}
variable "set_ecs_task_container_port" {}
variable "set_ecr_image_tag" {}
variable "set_ecs_log_group_name" {}
variable "set_ecs_log_group_region" {}
variable "get_alb_arn" {}
variable "get_alb_tg_arn" {}

########################################################################################################################
### Create resources
########################################################################################################################
data "aws_vpc" "vpc_id" {
  filter {
    name   = "tag:Name"
    values = ["${var.set_username_prefix}"]
  }
}

data "aws_subnet_ids" "filtered_private_subnets" {
  vpc_id = data.aws_vpc.vpc_id.id

  filter {
    name   = "availabilityZone"
    values = ["eu-west-1a", "eu-west-1b"]
  }
  tags = {
    Private = "true"
  }
}

data "aws_security_group" "sg_id" {
  name   = "${var.set_username_prefix}-weather-app-ecs-sg"
  vpc_id = data.aws_vpc.vpc_id.id
}

data "aws_subnet" "private_subnets" {
  for_each = data.aws_subnet_ids.filtered_private_subnets.ids
  id       = each.value
}

data "aws_iam_role" "iam_role_name" {
  name = "${var.set_username_prefix}-EcsExecutionRole"
}

data "aws_ecr_repository" "ecr_repo_name" {
  name = "${var.set_username_prefix}-node-weather-app"
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.set_username_prefix}-${var.set_ecs_cluster_name}"
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
  tags = {
    Name = "${var.set_username_prefix} - ${var.set_ecs_cluster_name}"
  }
}

resource "aws_ecs_task_definition" "ecs_task" {
  family             = "${var.set_username_prefix}-${var.set_ecs_task_name}"
  network_mode       = "awsvpc"
  execution_role_arn = data.aws_iam_role.iam_role_name.arn
  cpu                = var.set_ecs_task_cpu
  memory             = var.set_ecs_task_mem
  container_definitions = jsonencode([
    {
      "portMappings" : [
        {
          "protocol" : "tcp",
          "containerPort" : "${var.set_ecs_task_container_port}"
        }
      ],
      "logConfiguration" : {
        "logDriver" : "awslogs",
        "options" : {
          "awslogs-create-group" : "true",
          "awslogs-group" : "${var.set_ecs_log_group_name}",
          "awslogs-region" : "${var.set_ecs_log_group_region}",
          "awslogs-stream-prefix" : "ecs/weather-app-service/ecs-task-id"
        }
      },
      "name" : "weather-app",
      "image" : "${data.aws_ecr_repository.ecr_repo_name.repository_url}:${var.set_ecr_image_tag}",
      "requiresCompatibilities" : [
        "FARGATE"
      ]
    }
  ])
}

resource "aws_ecs_service" "ecs_service" {
  launch_type     = "FARGATE"
  task_definition = aws_ecs_task_definition.ecs_task.arn
  name            = "${var.set_username_prefix}-weather-app-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  desired_count   = 2

  load_balancer {
    target_group_arn = var.get_alb_tg_arn
    container_name   = "weather-app"
    container_port   = var.set_ecs_task_container_port
  }

  network_configuration {
    security_groups  = [data.aws_security_group.sg_id.id]
    subnets          = [for s in data.aws_subnet.private_subnets : s.id]
    assign_public_ip = false
  }
  depends_on = [var.get_alb_arn, var.get_alb_tg_arn]
}

########################################################################################################################
### Define outputs
########################################################################################################################
output "ecs_cluster_arn" {
  description = "The arn of the ecs cluster"
  value       = aws_ecs_cluster.ecs_cluster.arn
}

output "ecs_task_arn" {
  description = "The arn of the ecs task definition"
  value       = aws_ecs_task_definition.ecs_task.arn
}

output "ecs_task_revision" {
  description = "The revision of the ecs task in a particular family"
  value       = aws_ecs_task_definition.ecs_task.revision
}

output "ecs_service_name" {
  description = "Name of the service"
  value       = aws_ecs_service.ecs_service.name
}

output "ecs_service_cluster" {
  description = "Amazon Resource Name (ARN) of cluster which the service runs on"
  value       = aws_ecs_service.ecs_service.cluster
}

output "ecs_service_desired_count" {
  description = "Number of instances of the task definition"
  value       = aws_ecs_service.ecs_service.desired_count
}



