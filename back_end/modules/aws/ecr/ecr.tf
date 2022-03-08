########################################################################################################################
# Define variables
########################################################################################################################
variable "set_username_prefix" {}
variable "set_custom_tags" {}
variable "set_ecr_repo_name" {}

########################################################################################################################
### Create resources
########################################################################################################################
resource "aws_ecr_repository" "ecr_repo" {
  name                 = "${var.set_username_prefix}-${var.set_ecr_repo_name}"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = var.set_custom_tags
}

########################################################################################################################
### Define outputs
########################################################################################################################
output "ecr_repo_registry_id" {
  description = "The registry ID where the repository was created"
  value       = aws_ecr_repository.ecr_repo.registry_id
}

output "ecr_repo_repository_url" {
  description = "The URL of the repository (in the form"
  value       = aws_ecr_repository.ecr_repo.repository_url
}
