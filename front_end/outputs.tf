########################################################################################################################
### aws_alb module outputs
########################################################################################################################
output "alb_arn" {
  description = "The ARN of the load balancer"
  value       = module.aws_alb.alb_arn
}

output "alb_fqdn" {
  description = "The DNS name of the load balancer"
  value       = module.aws_alb.alb_fqdn
}

output "alb_target_group_arn" {
  description = "ARN of the Target Group"
  value       = module.aws_alb.alb_target_group_arn
}

########################################################################################################################
### aws_ecs module outputs
########################################################################################################################
output "ecs_cluster_arn" {
  description = "The arn of the ecs cluster"
  value       = module.aws_ecs.ecs_cluster_arn
}

output "ecs_task_arn" {
  description = "The arn of the ecs task definition"
  value       = module.aws_ecs.ecs_task_arn
}

output "ecs_task_revision" {
  description = "The revision of the ecs task in a particular family"
  value       = module.aws_ecs.ecs_task_revision
}

output "ecs_service_name" {
  description = "Name of the service"
  value       = module.aws_ecs.ecs_service_name
}

output "ecs_service_cluster" {
  description = "Amazon Resource Name (ARN) of cluster which the service runs on"
  value       = module.aws_ecs.ecs_service_cluster
}

output "ecs_service_desired_count" {
  description = "Number of instances of the task definition"
  value       = module.aws_ecs.ecs_service_desired_count
}
