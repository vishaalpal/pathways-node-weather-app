<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3"></a> [s3](#module\_s3) | ./modules/aws/s3 | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | n/a |
| <a name="module_vpc_endpoints"></a> [vpc_endpoints](#module\_vpc\_endpoints) | ./modules/aws/vpc_endpoints | n/a |

<!-- ## Resources

No resources. -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_set_username_prefix"></a> [set\_username\_prefix](#input\_set\_username\_prefix) | Name to be used on all the resources as identifier | `string` | null | yes |
| <a name="input_set_custom_tags"></a> [set\_custom\_tags](#input\_set\_custom\_tags) | Use tags to identify project resources | <pre>map(string){<br>  Student_Name = string<br>  Project_name = string<br>  Pathway = string<br>}</pre> | null | yes |
| <a name="input_set_vpc_cidr_range"></a> [set\_vpc\_cidr\_range](#input\_set\_vpc\_cidr\_range) | Specifies the name of an S3 Bucket | `string` | null | yes |
| <a name="input_set_private_subnets_cidr"></a> [set\_private\_subnets_cidr](#input\_set\_private\_subnets_cidr) | A list of private subnets inside the VPC | `list(string)` | null | yes |
| <a name="input_set_private_subnet_tags"></a> [set\_private\_subnet\_tags](#input\_set\_private\_subnet\_tags) | Additional tags for the private subnets | <pre>map(string){<br>  Private = string<br>}</pre> | null | yes |
| <a name="input_set_public_subnets_cidr"></a> [set\_public\_subnets\_cidr](#input\_set\_public\_subnets\_cidr) | A list of public subnets inside the VPC | `list(string)` | null | yes |
| <a name="input_set_public_subnet_tags"></a> [set\_public\_subnet\_tags](#input\_set\_public\_subnet\_tags) | Additional tags for the public subnets | <pre>map(string){<br>  Public = string<br>}</pre> | null | yes |
| <a name="input_set_azs"></a> [set\_azs](#input\_set\_azs) | A list of availability zones names or ids in the region | `list(string)` | null | yes |
| <a name="input_create_igw"></a> [create\_igw](#input\_create\_igw) | Controls if an Internet Gateway is created for public subnets and the related routes that connect them | `bool` | null | yes |
| <a name="input_enable_nat_gateway"></a> [enable\_nat\_gateway](#input\_enable\_nat\_gateway) | Should be true if you want to provision NAT Gateways for each of your private networks | `bool` | null | yes |
| <a name="input_create_nat_gateway_per_az"></a> [create\_nat\_gateway\_per\_az](#input\_create\_nat\_gateway\_per\_az) | Should be true if you want only one NAT Gateway per availability zone. Requires `var.azs` to be set, and the number of `public_subnets` created to be greater than or equal to the number of availability zones specified in `var.azs` | `bool` | null | yes |
| <a name="input_set_s3_bucket_name"></a> [set\_s3\_bucket\_name](#input\_set\_s3\_bucket\_name) | Specifies the name of an S3 Bucket | `string` | null | yes |
| <a name="input_set_ecr_bucket_arn"></a> [set\_ecr\_bucket_arn](#input\_set\_ecr\_bucket_arn) | Specifies the bucket ARN for the ECR service | `list(string)` | null | yes |
| <a name="input_set_s3_gateway_endpoint"></a> [set\_s3\_gateway\_endpoint](#input\_set\_s3\_gateway\_endpoint) | Specifies the service name for the gateway endpoint | `string` | null | yes |
| <a name="input_set_cw_gateway_endpoint"></a> [set\_cw\_gateway\_endpoint](#input\_set\_cw\_gateway\_endpoint) | Specifies the service name for the gateway endpoint | `string` | null | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_name"></a> [vpc\_name](#output\_vpc\_name) | The name of the VPC specified as argument to this module |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The unique identifier of the VPC |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | The CIDR block of the VPC |
| <a name="output_vpc_enable_dns_support"></a> [vpc\_enable\_dns\_support](#output\_vpc\_enable\_dns\_support) | Whether or not the VPC has DNS support |
| <a name="output_vpc_instance_tenancy"></a> [vpc\_instance\_tenancy](#output\_vpc\_instance\_tenancy) | Tenancy of instances spin up within VPC |
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | List of IDs of private subnets |
| <a name="output_private_subnet_cidr_blocks"></a> [private\_subnet\_cidr\_blocks](#output\_private\_subnet\_cidr\_blocks) | List of cidr_blocks of private subnets |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | List of IDs of public subnets |
| <a name="output_public_subnet_cidr_blocks"></a> [public\_subnet\_cidr\_blocks](#output\_public\_subnet\_cidr\_blocks) | List of cidr_blocks of public subnets |
| <a name="output_internet_gateway_id"></a> [internet\_gateway\_id](#output\_internet\_gateway\_id) | The ID of the Internet Gateway |
| <a name="output_nat_gateway_ids"></a> [nat\_gateway\_ids](#output\_nat\_gateway\_ids) | List of NAT Gateway IDs |
| <a name="output_nat_gateway_public_ip_addresses"></a> [nat\_gateway\_public\_ip\_addresses](#output\_nat\_gateway\_public\_ip\_addresses) | List of public Elastic IPs created for AWS NAT Gateway |
| <a name="output_private_nat_gateway_route_ids"></a> [private\_nat\_gateway\_route\_ids](#output\_private\_nat\_gateway\_route\_ids) | List of IDs of the private nat gateway route |
| <a name="output_private_route_table_ids"></a> [private\_route\_table\_ids](#output\_private\_route\_table\_ids) | List of IDs of private route tables |
| <a name="output_public_route_table_ids"></a> [public\_route\_table\_ids](#output\_public\_route\_table\_ids) | List of IDs of public route tables|
| <a name="output_s3_bucket_name"></a> [s3\_bucket\_name](#output\_s3\_bucket\_name) | The name of the bucket |
| <a name="output_s3_bucket_name_arn"></a> [s3\_bucket\_name\_arn](#output\_s3\_bucket\_name\_arn) | The arn of the bucket |
| <a name="output_s3_bucket_acl"></a> [s3\_bucket\_acl](#output\_s3\_bucket\_acl) | The canned ACL applied to the bucket |
| <a name="output_s3_bucket_region"></a> [s3\_bucket\_region](#output\_s3\_bucket\_region) | The AWS region this bucket resides in |
| <a name="output_s3_bucket_regional_domain_name"></a> [s3\_bucket\_regional\_domain\_name](#output\_s3\_bucket\_regional\_domain\_name) | The bucket region-specific domain name |
| <a name="output_s3_gateway_endpoint_id"></a> [s3\_gateway\_endpoint\_id](#output\_s3\_gateway\_endpoint\_id) | The ID of the VPC endpoint |
| <a name="output_cwlogs_gateway_endpoint_id"></a> [cw\_gateway\_endpoint\_id](#output\_cw\_gateway\_endpoint\_id) | The ID of the VPC endpoint |
<!-- END_TF_DOCS -->