########################################################################################################################
# Define variables
########################################################################################################################
variable "set_custom_tags" {}
variable "set_ecr_bucket_arn" {}
variable "set_s3_gateway_endpoint" {}
variable "set_cw_gateway_endpoint" {}
variable "get_s3_bucket_arn" {}
variable "get_vpc_id" {}
variable "get_vpc_cidr_block" {}
variable "get_public_route_table_ids" {}
variable "get_private_route_table_ids" {}

########################################################################################################################
### Create resources
########################################################################################################################
data "aws_iam_policy_document" "s3_gateway_policy_content" {
  statement {
    sid = "S3BucketAccess"
    actions = [
      "s3:ListBucket",
      "s3:GetObject",
      "s3:PutObject"
    ]
    resources = [
      "${var.get_s3_bucket_arn}",
      "${var.get_s3_bucket_arn}/*",
      "${var.set_ecr_bucket_arn}/*"
    ]
    effect = "Allow"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}

data "aws_iam_policy_document" "cw_gateway_policy_content" {
  statement {
    sid       = "CloudWatchLogsAccess"
    actions   = ["logs:*"]
    resources = ["*"]
    effect    = "Allow"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}

resource "aws_security_group" "cwlogs_gateway_endpoint_sg" {
  name        = "cwlogs_gateway_endpoint_sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.get_vpc_id

  ingress {
    description = "Allow all traffic from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.get_vpc_cidr_block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "cwlogs_gateway_endpoint_sg"
  }
}

resource "aws_vpc_endpoint" "s3_gateway_endpoint" {
  service_name      = var.set_s3_gateway_endpoint
  vpc_id            = var.get_vpc_id
  vpc_endpoint_type = "Gateway"
  policy            = data.aws_iam_policy_document.s3_gateway_policy_content.json
  auto_accept       = true
  tags              = var.set_custom_tags
}

resource "aws_vpc_endpoint" "cwlogs_gateway_endpoint" {
  service_name       = var.set_cw_gateway_endpoint
  vpc_id             = var.get_vpc_id
  vpc_endpoint_type  = "Interface"
  security_group_ids = [aws_security_group.cwlogs_gateway_endpoint_sg.id]
  policy             = data.aws_iam_policy_document.cw_gateway_policy_content.json
  auto_accept        = true
  tags               = var.set_custom_tags
}

resource "aws_vpc_endpoint_route_table_association" "public_s3_gateway_endpoint_route_table_association" {
  count           = length(var.get_public_route_table_ids)
  route_table_id  = var.get_public_route_table_ids[count.index]
  vpc_endpoint_id = aws_vpc_endpoint.s3_gateway_endpoint.id
}

resource "aws_vpc_endpoint_route_table_association" "private_s3_gateway_endpoint_route_table_association" {
  count           = length(var.get_private_route_table_ids)
  route_table_id  = var.get_private_route_table_ids[count.index]
  vpc_endpoint_id = aws_vpc_endpoint.s3_gateway_endpoint.id
}

########################################################################################################################
### Define outputs
########################################################################################################################
output "s3_gateway_endpoint_id" {
  description = "The ID of the S3 gateway VPC endpoint"
  value       = aws_vpc_endpoint.s3_gateway_endpoint.id
}

output "cwlogs_gateway_endpoint_id" {
  description = "The ID of the CloudWatch logs VPC endpoint"
  value       = aws_vpc_endpoint.cwlogs_gateway_endpoint.id
}
