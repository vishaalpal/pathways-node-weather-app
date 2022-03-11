########################################################################################################################
### Tag variable values
########################################################################################################################
set_username_prefix = "vishaalpal"
set_custom_tags = {
  Student_Name = "Vishaal Pal"
  Project_Name = "pathways-node-weather-app"
  Pathway      = "Contino Infrastructure Engineer to Cloud Engineer Pathway"
}
########################################################################################################################
### aws_vpc module variable values
########################################################################################################################
set_vpc_cidr_range       = "10.0.1.0/24"
set_private_subnets_cidr = ["10.0.1.0/26", "10.0.1.64/26", "10.0.1.128/26"]
set_private_subnet_tags = {
  Private = "true"
}
set_public_subnets_cidr = ["10.0.1.192/28", "10.0.1.208/28", "10.0.1.224/28"]
set_public_subnet_tags = {
  Public = "true"
}
set_azs                   = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
create_igw                = true
enable_nat_gateway        = true
create_nat_gateway_per_az = true

########################################################################################################################
### aws_s3 module variable values
########################################################################################################################
set_s3_bucket_name = "vishaalpal-pathways-node-weather-app"

########################################################################################################################
### aws_vpc_endpoints module variable values
########################################################################################################################
set_ecr_bucket_arn      = "arn:aws:s3:::prod-eu-west-1-starport-layer-bucket"
set_s3_gateway_endpoint = "com.amazonaws.eu-west-1.s3"
set_cw_gateway_endpoint = "com.amazonaws.eu-west-1.logs"

########################################################################################################################
### aws_sg module variable values
########################################################################################################################
set_alb_sg_name        = "cwlogs_gateway_endpoint_sg"
set_alb_sg_description = "Allow incoming HTTPS traffic from VPC"
set_cwgateway_sg_ingress_rules = [{
  from     = 443
  to       = 443
  protocol = "tcp"
  cidr     = ["0.0.0.0/0"]
}]
set_cwgateway_sg_egress_rules = [{
  from     = 0
  to       = 0
  protocol = "-1"
  cidr     = ["0.0.0.0/0"]
}]
