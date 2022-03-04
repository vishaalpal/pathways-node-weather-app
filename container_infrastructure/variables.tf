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
### Fargate module variables
########################################################################################################################
variable "set_ecr_repo_name" {
  type        = string
  description = "Specifies the name of the ECR repository"
  default     = null
}
