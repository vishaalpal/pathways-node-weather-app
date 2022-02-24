########################################################################################################################
# Define variables
########################################################################################################################
variable "bucket" {}
variable "tags" {}
variable "set_s3_gateway_endpoint" {}
variable "vpc_id" {}

########################################################################################################################
### Create resources
########################################################################################################################
resource "aws_s3_bucket" "this" {
  bucket = var.bucket
  acl    = "private"

  tags = var.tags
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = var.vpc_id
  service_name = var.set_s3_gateway_endpoint
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
