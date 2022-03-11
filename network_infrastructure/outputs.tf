########################################################################################################################
### aws_vpc module outputs
########################################################################################################################
output "vpc_name" {
  description = "The name of the VPC specified as argument to this module"
  value       = module.aws_vpc.name
}
output "vpc_id" {
  description = "The unique identifier of the VPC"
  value       = module.aws_vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.aws_vpc.vpc_cidr_block
}

output "vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = module.aws_vpc.vpc_enable_dns_hostnames
}

output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = module.aws_vpc.vpc_enable_dns_support
}

output "vpc_instance_tenancy" {
  description = "Tenancy of instances spin up within VPC"
  value       = module.aws_vpc.vpc_instance_tenancy
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets"
  value       = module.aws_vpc.private_subnets
}

output "private_subnet_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.aws_vpc.private_subnets_cidr_blocks
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = module.aws_vpc.public_subnets
}

output "public_subnet_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = module.aws_vpc.public_subnets_cidr_blocks
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = module.aws_vpc.igw_id
}

output "nat_gateway_ids" {
  description = "List of NAT Gateway IDs"
  value       = module.aws_vpc.natgw_ids
}

output "nat_gateway_public_ip_addresses" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = module.aws_vpc.nat_public_ips
}

output "private_nat_gateway_route_ids" {
  description = "List of IDs of the private nat gateway route"
  value       = module.aws_vpc.private_nat_gateway_route_ids
}

output "private_route_table_ids" {
  description = "List of IDs of private route tables"
  value       = module.aws_vpc.private_route_table_ids
}

output "public_route_table_ids" {
  description = "List of IDs of public route tables"
  value       = module.aws_vpc.public_route_table_ids
}

########################################################################################################################
### aws_s3 module outputs
########################################################################################################################
output "s3_bucket_name" {
  description = "The name of the bucket"
  value       = module.aws_s3.s3_bucket_name
}

output "s3_bucket_name_arn" {
  description = "The arn of the bucket"
  value       = module.aws_s3.s3_bucket_name_arn
}

output "s3_bucket_acl" {
  description = "The canned ACL applied to the bucket"
  value       = module.aws_s3.s3_bucket_acl
}

output "s3_bucket_region" {
  description = "The AWS region this bucket resides in"
  value       = module.aws_s3.s3_bucket_region
}

output "s3_bucket_regional_domain_name" {
  description = "The bucket region-specific domain name"
  value       = module.aws_s3.s3_bucket_regional_domain_name
}

########################################################################################################################
### aws_sg module outputs
########################################################################################################################
output "cw_endpoint_sg_id" {
  description = "The ID of the security group"
  value       = module.aws_sg.cw_endpoint_sg_id
}

########################################################################################################################
### aws_vpc_endpoints module outputs
########################################################################################################################
output "s3_gateway_endpoint_id" {
  description = "The ID of the VPC endpoint"
  value       = module.aws_vpc_endpoints.s3_gateway_endpoint_id
}

output "cw_interface_endpoint_id" {
  description = "The ID of the VPC endpoint"
  value       = module.aws_vpc_endpoints.cw_interface_endpoint_id
}
