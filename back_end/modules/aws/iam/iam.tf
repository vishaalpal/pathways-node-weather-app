########################################################################################################################
# Define variables
########################################################################################################################
variable "set_username_prefix" {}

########################################################################################################################
### Create resources
########################################################################################################################
data "aws_iam_policy_document" "render_ecs_execution_policy" {
  statement {
    sid = "ECSPullImageFromECR"
    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:BatchGetImage",
      "ecr:GetDownloadUrlForLayer",
      "ecr:GetAuthorizationToken"
    ]
    resources = ["*"]
    effect    = "Allow"
  }
}

data "aws_iam_policy_document" "render_assume_role_policy" {
  statement {
    sid     = "ECSAssumeRole"
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "render_ecs_log_creation_policy" {
  statement {
    sid       = "ECSCreateCloudWatchLogPermissions"
    actions   = ["logs:*"]
    resources = ["*"]
    effect    = "Allow"
  }
}

resource "aws_iam_policy" "ecs_execution_policy" {
  name        = "${var.set_username_prefix}-EcsEcrAccess"
  path        = "/"
  description = "Allows Amazon ECS to pull images from the Amazon ECR service"
  policy      = data.aws_iam_policy_document.render_ecs_execution_policy.json
}

resource "aws_iam_policy" "ecs_log_creation_policy" {
  name        = "${var.set_username_prefix}-ecs-log-creation"
  path        = "/"
  description = "Allows Amazon ECS to pull images from the Amazon ECR service"
  policy      = data.aws_iam_policy_document.render_ecs_log_creation_policy.json
}

resource "aws_iam_role" "ecs_iam_role" {
  name               = "${var.set_username_prefix}-EcsExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.render_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "ecs_execution_policy_attachment" {
  role       = aws_iam_role.ecs_iam_role.name
  policy_arn = aws_iam_policy.ecs_execution_policy.arn
}

resource "aws_iam_role_policy_attachment" "ecs_log_creation_policy_attachment" {
  role       = aws_iam_role.ecs_iam_role.name
  policy_arn = aws_iam_policy.ecs_log_creation_policy.arn
}

########################################################################################################################
### Define outputs
########################################################################################################################
output "iam_policy_id" {
  description = "The name of the IAM policy"
  value       = aws_iam_policy.ecs_execution_policy.name
}

output "iam_role_id" {
  description = "The name of the IAM role"
  value       = aws_iam_role.ecs_iam_role.id
}

output "iam_role_arn" {
  description = "Amazon Resource Name (ARN) specifying the role"
  value       = aws_iam_role.ecs_iam_role.arn
}
