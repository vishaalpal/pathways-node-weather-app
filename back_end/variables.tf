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
### aws_ecr module variables
########################################################################################################################
variable "set_ecr_repo_name" {
  type        = string
  description = "Specifies the name of the ECR repository"
  default     = null
}

########################################################################################################################
### aws_sg module variables
########################################################################################################################
variable "alb_sg_name" {
  type        = string
  description = "The name of the security group"
  default     = null
}

variable "alb_sg_description" {
  type        = string
  description = "The description of the security group"
  default     = null
}

variable "alb_ingress_rules" {
  type = list(object({
    from     = number
    to       = number
    protocol = string
    cidr     = list(string)
  }))
  description = "Specifies ingress rules for a security group"
  default     = null
}

variable "alb_egress_rules" {
  type = list(object({
    from     = number
    to       = number
    protocol = string
    cidr     = list(string)
  }))
  description = "Specifies egress rules for a security group"
  default     = null
}

variable "ecs_sg_name" {
  type        = string
  description = "The name of the security group"
  default     = null
}

variable "ecs_sg_description" {
  type        = string
  description = "The description of the security group"
  default     = null
}

variable "ecs_egress_rules" {
  type = list(object({
    from     = number
    to       = number
    protocol = string
    cidr     = list(string)
  }))
  description = "Specifies egress rules for a security group"
  default     = null
}

