########################################################################################################################
# Define variables
########################################################################################################################
variable "set_custom_tags" {}
variable "set_s3_bucket_name" {}

########################################################################################################################
### Create resources
########################################################################################################################
resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.set_s3_bucket_name
  acl    = "private"
  tags   = var.set_custom_tags
}

########################################################################################################################
### Define outputs
########################################################################################################################
output "s3_bucket_name" {
  description = "The name of the bucket"
  value       = aws_s3_bucket.s3_bucket.id
}

output "s3_bucket_name_arn" {
  description = "The arn of the bucket"
  value       = aws_s3_bucket.s3_bucket.arn
}

output "s3_bucket_acl" {
  description = "The canned ACL applied to the bucket"
  value       = aws_s3_bucket.s3_bucket.acl
}

output "s3_bucket_region" {
  description = "The AWS region the bucket resides in"
  value       = aws_s3_bucket.s3_bucket.region
}

output "s3_bucket_regional_domain_name" {
  description = "The bucket region-specific domain name"
  value       = aws_s3_bucket.s3_bucket.bucket_regional_domain_name
}
