########################################################################################################################
### Tag variables
########################################################################################################################
variable "set_username_prefix" {
  type        = string
  description = "Name to be used on all the resources as identifier"
  default     = "vishaalpal"
}

variable "set_custom_tags" {
  type        = map(string)
  description = "Use tags to identify project resources"
  default = {
    Student      = "vishaalpal"
    Project_Name = "pathways-node-weather-app-quick-start"
    Pathway      = "Contino Infra Engineer to Cloud Engineer Pathway"
  }
}

########################################################################################################################
### Network module variables
########################################################################################################################
variable "set_vpc_cidr_range" {
  type        = string
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  default     = "10.0.1.0/24"
}

variable "create_private_subnets" {
  type        = list(string)
  description = "A list of private subnets inside the VPC"
  default     = ["10.0.1.0/26", "10.0.1.64/26", "10.0.1.128/26"]
}

variable "create_public_subnets" {
  type        = list(string)
  description = "A list of public subnets inside the VPC"
  default     = ["10.0.1.192/28", "10.0.1.208/28", "10.0.1.224/28"]
}

variable "get_azs" {
  type        = list(string)
  description = "A list of availability zones names or ids in the region"
  default     = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
}

variable "create_igw" {
  type        = bool
  description = "Controls if an Internet Gateway is created for public subnets and the related routes that connect them"
  default     = true
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  default     = true
}

variable "create_nat_gateway_per_az" {
  type        = bool
  description = "Should be true if you want only one NAT Gateway per availability zone. Requires `var.azs` to be set, and the number of `public_subnets` created to be greater than or equal to the number of availability zones specified in `var.azs`"
  default     = true
}

########################################################################################################################
### S3 module variables
########################################################################################################################

variable "bucket" {
  type        = string
  description = "Specifies the name of an S3 Bucket"
  default     = "vishaalpal-pathwaysdojoinfra-weatherapp-tf-bucket"
}

variable "set_s3_gateway_endpoint" {
  type        = string
  description = "Specifies the service name for the gateway endpoint"
  default     = "com.amazonaws.ap-northeast-1.s3"
}
