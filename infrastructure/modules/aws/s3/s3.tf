########################################################################################################################
# Define variables
########################################################################################################################
variable "bucket" {}
variable "set_custom_tags" {}
variable "set_s3_gateway_endpoint" {}
variable "vpc_id" {}
variable "public_route_table_ids" {}
variable "private_route_table_ids" {}

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
    sid       = "ViewBucketPermissions"
    actions   = ["s3:ListBucket"]
    resources = ["${aws_s3_bucket.this.arn}"]
    effect    = "Allow"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
  statement {
    sid       = "ReadWriteBucketPermissions"
    actions   = ["s3:GetObject", "s3:PutObject"]
    resources = ["${aws_s3_bucket.this.arn}/*"]
    effect    = "Allow"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
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
