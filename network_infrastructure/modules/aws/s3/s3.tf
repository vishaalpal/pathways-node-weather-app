########################################################################################################################
# Define variables
########################################################################################################################
variable "bucket" {}
variable "set_custom_tags" {}
variable "set_s3_gateway_endpoint" {}
variable "vpc_id" {}
variable "vpc_cidr_block" {}
variable "public_route_table_ids" {}
variable "private_route_table_ids" {}
variable "set_cw_gateway_endpoint" {}

########################################################################################################################
### Create resources
########################################################################################################################
resource "aws_s3_bucket" "this" {
  bucket = var.bucket
  acl    = "private"
  tags   = var.set_custom_tags
}

data "aws_iam_policy_document" "s3_gateway_policy_content" {
  statement {
    sid = "S3BucketAccess"
    actions = [
      "s3:ListBucket",
      "s3:GetObject",
      "s3:PutObject"
    ]
    resources = [
      "${aws_s3_bucket.this.arn}",
      "${aws_s3_bucket.this.arn}/*",
      "arn:aws:s3:::prod-eu-west-1-starport-layer-bucket/*"
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
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow all traffic from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr_block]
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
  vpc_id            = var.vpc_id
  vpc_endpoint_type = "Gateway"
  policy            = data.aws_iam_policy_document.s3_gateway_policy_content.json
  auto_accept       = true
  tags              = var.set_custom_tags
}

resource "aws_vpc_endpoint" "cwlogs_gateway_endpoint" {
  service_name        = var.set_cw_gateway_endpoint
  vpc_id              = var.vpc_id
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.cwlogs_gateway_endpoint_sg.id]
  private_dns_enabled = true
  policy              = data.aws_iam_policy_document.cw_gateway_policy_content.json
  auto_accept         = true
  tags                = var.set_custom_tags
}

resource "aws_vpc_endpoint_route_table_association" "public_s3_gateway_endpoint_route_table_association" {
  count           = length(var.public_route_table_ids)
  route_table_id  = var.public_route_table_ids[count.index]
  vpc_endpoint_id = aws_vpc_endpoint.s3_gateway_endpoint.id
}

resource "aws_vpc_endpoint_route_table_association" "private_s3_gateway_endpoint_route_table_association" {
  count           = length(var.private_route_table_ids)
  route_table_id  = var.private_route_table_ids[count.index]
  vpc_endpoint_id = aws_vpc_endpoint.s3_gateway_endpoint.id
}

########################################################################################################################
### Define outputs
########################################################################################################################
output "s3_bucket_name" {
  description = "The name of the bucket"
  value       = aws_s3_bucket.this.id
}

output "s3_bucket_name_arn" {
  description = "The name of the bucket"
  value       = aws_s3_bucket.this.arn
}

output "s3_bucket_acl" {
  description = "The canned ACL applied to the bucket"
  value       = aws_s3_bucket.this.acl
}

output "s3_bucket_region" {
  description = "The AWS region this bucket resides in"
  value       = aws_s3_bucket.this.region
}

output "s3_bucket_regional_domain_name" {
  description = "The bucket region-specific domain name"
  value       = aws_s3_bucket.this.bucket_regional_domain_name
}

output "s3_gateway_endpoint_id" {
  description = "The ID of the VPC endpoint"
  value       = aws_vpc_endpoint.s3_gateway_endpoint.id
}

output "cwlogs_gateway_endpoint_id" {
  description = "The ID of the VPC endpoint"
  value       = aws_vpc_endpoint.cwlogs_gateway_endpoint.id
}
