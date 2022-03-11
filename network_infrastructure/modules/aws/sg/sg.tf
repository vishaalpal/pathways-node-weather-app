########################################################################################################################
# Define variables
########################################################################################################################
# variable "vpc_id" {}
variable "set_username_prefix" {}
variable "set_cwgateway_sg_name" {}
variable "set_cwgateway_sg_description" {}
variable "get_vpc_id" {}
variable "set_cwgateway_sg_ingress_rules" {}
variable "set_cwgateway_sg_egress_rules" {}

########################################################################################################################
# Create resources
########################################################################################################################
resource "aws_security_group" "cwlogs_gateway_endpoint_sg" {
  name        = "${var.set_username_prefix}-${var.set_cwgateway_sg_name}"
  description = var.set_cwgateway_sg_description
  vpc_id      = var.get_vpc_id

  dynamic "ingress" {
    for_each = var.set_cwgateway_sg_ingress_rules
    content {
      from_port   = ingress.value.from
      to_port     = ingress.value.to
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr
    }
  }

  dynamic "egress" {
    for_each = var.set_cwgateway_sg_egress_rules
    content {
      from_port   = egress.value.from
      to_port     = egress.value.to
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr
    }
  }
  tags = {
    Name = "${var.set_username_prefix}-${var.set_cwgateway_sg_name}"
  }
}

########################################################################################################################
# Define outputs
########################################################################################################################
output "cwlogs_gateway_endpoint_sg_id" {
  description = "The ID of the security group"
  value       = aws_security_group.cwlogs_gateway_endpoint_sg.id
}
