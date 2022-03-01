########################################################################################################################
### Network module outputs
########################################################################################################################
output "vpc_name" {
  description = "The name of the VPC specified as argument to this module"
  value       = module.network.name
}
output "vpc_id" {
  description = "The unique identifier of the VPC"
  value       = module.network.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.network.vpc_cidr_block
}

output "vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = module.network.vpc_enable_dns_hostnames
}

output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = module.network.vpc_enable_dns_support
}

output "vpc_instance_tenancy" {
  description = "Tenancy of instances spin up within VPC"
  value       = module.network.vpc_instance_tenancy
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets"
  value       = module.network.private_subnets
}

output "private_subnet_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.network.private_subnets_cidr_blocks
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = module.network.public_subnets
}

output "public_subnet_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = module.network.public_subnets_cidr_blocks
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = module.network.igw_id
}

output "nat_gateway_ids" {
  description = "List of NAT Gateway IDs"
  value       = module.network.natgw_ids
}

output "nat_gateway_public_ip_addresses" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = module.network.nat_public_ips
}

output "private_nat_gateway_route_ids" {
  description = "List of IDs of the private nat gateway route"
  value       = module.network.private_nat_gateway_route_ids
}

output "private_route_table_ids" {
  description = "List of IDs of private route tables"
  value       = module.network.private_route_table_ids
}

output "public_route_table_ids" {
  description = "List of IDs of public route tables"
  value       = module.network.public_route_table_ids
}

########################################################################################################################
### S3 module outputs
########################################################################################################################
output "s3_bucket_name" {
  description = "The name of the bucket"
  value       = module.s3_bucket.s3_bucket_name
}

output "s3_bucket_name_arn" {
  description = "The name of the bucket"
  value       = module.s3_bucket.s3_bucket_name_arn
}

output "s3_bucket_acl" {
  description = "The canned ACL applied to the bucket"
  value       = module.s3_bucket.s3_bucket_acl
}

output "s3_bucket_region" {
  description = "The AWS region this bucket resides in"
  value       = module.s3_bucket.s3_bucket_region
}

output "s3_bucket_regional_domain_name" {
  description = "The bucket region-specific domain name"
  value       = module.s3_bucket.s3_bucket_regional_domain_name
}
