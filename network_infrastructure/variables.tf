########################################################################################################################
### Tag variables
########################################################################################################################
variable "set_username_prefix" {
  type        = string
  description = "Name to be used on all the resources as identifier"
  default     = null
}

variable "set_custom_tags" {
  type        = map(string)
  description = "Use tags to identify project resources"
  default = {
    Student_Name = null
    Project_Name = null
    Pathway      = null
  }
}

########################################################################################################################
### aws_vpc module variables
########################################################################################################################
variable "set_vpc_cidr_range" {
  type        = string
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  default     = null
}

variable "set_private_subnets_cidr" {
  type        = list(string)
  description = "A list of private subnets inside the VPC"
  default     = null
}

variable "set_private_subnet_tags" {
  type        = map(string)
  description = "Additional tags for the private subnets"
  default     = null
}

variable "set_public_subnets_cidr" {
  type        = list(string)
  description = "A list of public subnets inside the VPC"
  default     = null
}

variable "set_public_subnet_tags" {
  type        = map(string)
  description = "Additional tags for the public subnets"
  default     = null
}

variable "set_azs" {
  type        = list(string)
  description = "A list of availability zones names or ids in the region"
  default     = null
}

variable "create_igw" {
  type        = bool
  description = "Controls if an Internet Gateway is created for public subnets and the related routes that connect them"
  default     = null
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  default     = null
}

variable "create_nat_gateway_per_az" {
  type        = bool
  description = "Should be true if you want only one NAT Gateway per availability zone. Requires `var.azs` to be set, and the number of `public_subnets` created to be greater than or equal to the number of availability zones specified in `var.azs`"
  default     = null
}

########################################################################################################################
### aws_s3 module variables
########################################################################################################################
variable "set_s3_bucket_name" {
  type        = string
  description = "Specifies the name of an S3 Bucket"
  default     = null
}

########################################################################################################################
### aws_sg module variables
########################################################################################################################
variable "set_cw_endpoint_sg_name" {
  type        = string
  description = "The name of the security group"
  default     = null
}

variable "set_cw_endpoint_sg_description" {
  type        = string
  description = "The description of the security group"
  default     = null
}

variable "set_cw_endpoint_sg_ingress_rules" {
  type = list(object({
    from     = number
    to       = number
    protocol = string
    cidr     = list(string)
  }))
  description = "Specifies ingress rules for a security group"
  default     = null
}

variable "set_cw_endpoint_sg_egress_rules" {
  type = list(object({
    from     = number
    to       = number
    protocol = string
    cidr     = list(string)
  }))
  description = "Specifies egress rules for a security group"
  default     = null
}

########################################################################################################################
### aws_vpc_endpoints module variables
########################################################################################################################
variable "set_s3_gateway_endpoint" {
  type        = string
  description = "Specifies the service name for the gateway endpoint"
  default     = null
}

variable "set_cw_interface_endpoint" {
  type        = string
  description = "Specifies the service name for the interface endpoint"
  default     = null
}

variable "set_ecr_bucket_arn" {
  type        = string
  description = "Specifies the bucket ARN for the ECR service"
  default     = null
}

