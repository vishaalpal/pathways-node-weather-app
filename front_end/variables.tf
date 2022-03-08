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
### aws_alb module variables
########################################################################################################################
variable "alb_name" {
  type        = string
  description = "The name of the load balancer"
  default     = null
}

variable "alb_target_group_name" {
  type        = string
  description = "The name of the target group"
  default     = null
}

variable "alb_listener_name" {
  type        = string
  description = "The name of the listener"
  default     = null
}

########################################################################################################################
### aws_ecs module variables
########################################################################################################################
variable "ecs_cluster_name" {
  type        = string
  description = "The name of the ecs cluster"
  default     = null
}

variable "ecs_task_name" {
  type        = string
  description = "The name of the ecs task"
  default     = null
}

variable "ecs_task_cpu" {
  type        = number
  description = "Specified cpu allocation for an ecs task"
  default     = null
}

variable "ecs_task_mem" {
  type        = number
  description = "Specified memory allocation for an ecs task"
  default     = null
}

variable "ecs_task_container_port" {
  type        = number
  description = "Specified exposed port on the container for an ecs task"
  default     = null
}

variable "ecr_image_tag" {
  type        = string
  description = "Specified tag used for the ecr image"
  default     = null
}

variable "ecs_log_group_name" {
  type        = string
  description = "Specified cloudwatch log group name for the ECS service"
  default     = null
}

variable "ecs_log_group_region" {
  type        = string
  description = "Specified region for the cloudwatch log group for the ECS service"
  default     = null
}
