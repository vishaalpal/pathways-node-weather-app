########################################################################################################################
### aws_iam module outputs
########################################################################################################################
output "iam_policy_id" {
  description = "The name of the IAM policy"
  value       = module.aws_iam.iam_policy_id
}

output "iam_role_id" {
  description = "The name of the IAM role"
  value       = module.aws_iam.iam_role_id
}

output "iam_role_arn" {
  description = "Amazon Resource Name (ARN) specifying the role"
  value       = module.aws_iam.iam_role_arn
}

########################################################################################################################
### aws_sg module outputs
########################################################################################################################
output "alb_sg_id" {
  description = "The ID of the security group"
  value       = module.aws_sg.alb_sg_id
}

output "ecs_sg_id" {
  description = "The ID of the security group"
  value       = module.aws_sg.ecs_sg_id
}

########################################################################################################################
### aws_ecr module outputs
########################################################################################################################
output "ecr_repo_registry_id" {
  description = "The registry ID where the repository was created"
  value       = module.aws_ecr.ecr_repo_registry_id
}

output "ecr_repo_repository_url" {
  description = "The URL of the repository (in the form"
  value       = module.aws_ecr.ecr_repo_repository_url
}
