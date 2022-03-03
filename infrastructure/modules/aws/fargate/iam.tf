########################################################################################################################
# Define variables
########################################################################################################################

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
    sid     = ""
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "ecs_execution_policy" {
  name        = "${var.set_username_prefix}-EcsEcrAccess"
  path        = "/"
  description = "Allows Amazon ECS to pull images from the Amazon ECR service"
  policy      = data.aws_iam_policy_document.render_ecs_execution_policy.json
}

resource "aws_iam_role" "ecs_iam_role" {
  name               = "${var.set_username_prefix}-EcsExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.render_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "ecs_execution_policy_attachment" {
  role       = aws_iam_role.ecs_iam_role.name
  policy_arn = aws_iam_policy.ecs_execution_policy.arn
}
########################################################################################################################
### Define outputs
########################################################################################################################
