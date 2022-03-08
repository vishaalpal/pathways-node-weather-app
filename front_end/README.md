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
| <a name="module_alb"></a> [alb](#module\_alb) | ./modules/aws/alb | n/a |
| <a name="module_ecs"></a> [ecs](#module\_ecs) | ./modules/aws/ecs | n/a |

<!-- ## Resources

No resources. -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_set_username_prefix"></a> [set\_username\_prefix](#input\_set\_username\_prefix) | Name to be used on all the resources as identifier | `string` | null | yes |
| <a name="input_set_custom_tags"></a> [set\_custom\_tags](#input\_set\_custom\_tags) | Use tags to identify project resources | <pre>map(string){<br>  Student_Name = string<br>  Project_name = string<br>  Pathway = string<br>}</pre> | null | yes |
| <a name="input_alb_name"></a> [alb\_name](#input\_alb\_name) | The name of the load balancer | `string` | null | yes |
| <a name="input_alb_target_group_name"></a> [alb\_target\_group\_name](#input\_alb\_target\_group\_name) | The name of the target group | `string` | null | yes |
| <a name="input_alb_listener_name"></a> [alb\_listener\_name](#input\_alb\_listener\_name) | The name of the listener | `string` | null | yes |
| <a name="input_ecs_cluster_name"></a> [ecs\_cluster\_name](#input\_ecs\_cluster\_name) | The name of the ecs cluster | `string` | null | yes |
| <a name="input_ecs_task_name"></a> [ecs\_task\_name](#input\_ecs\_task\_name) | The name of the ecs task | `string` | null | yes |
| <a name="input_ecs_task_cpu"></a> [ecs\_task\_cpu](#input\_ecs\_task\_cpu) | Specified cpu allocation for an ecs task | `number` | null | yes |
| <a name="input_ecs_task_mem"></a> [ecs\_task\_mem](#input\_ecs\_task\_mem) | Specified memory allocation for an ecs task | `number` | null | yes |
| <a name="input_ecs_task_container_port"></a> [ecs\_task\_container\_port](#input\_ecs\_task\_container\_port) | Specified exposed port on the container for an ecs task | `number` | null | yes |
| <a name="input_ecr_image_tag"></a> [ecr\_image\_tag](#input\_ecr\_image\_tag) | Specified tag used for the ecr image | `string` | null | yes |
| <a name="input_ecs_log_group_name"></a> [ecs\_log\_group\_name](#input\_ecs\_log\_group\_name) | Specified cloudwatch log group name for the ECS service | `string` | null | yes |
| <a name="input_ecs_log_group_region"></a> [ecs\_log\_group\_region](#input\_ecs\_log\_group\_region) | Specified region for the cloudwatch log group for the ECS service | `string` | null | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_arn"></a> [alb\_arn](#output\_alb\_arn) | The ARN of the load balancer |
| <a name="output_alb_fqdn"></a> [alb\_fqdn](#output\_alb\_fqdn) | The DNS name of the load balancer |
| <a name="output_alb_target_group_arn"></a> [alb\_target\_group\_arn](#output\_alb\_target\_group\_arn) | ARN of the Target Group |
| <a name="output_ecs_cluster_arn"></a> [ecs\_cluster\_arn](#output\_ecs\_cluster\_arn) | The arn of the ecs cluster |
| <a name="output_ecs_task_arn"></a> [ecs\_task\_arn](#output\_ecs\_task\_arn) | The arn of the ecs task definition |
| <a name="output_ecs_task_revision"></a> [ecs\_task\_revision](#output\_ecs\_task\_revision) | The revision of the ecs task in a particular family |
| <a name="output_ecs_service_name"></a> [ecs\_service\_name](#output\_ecr\_service\_name) | Name of the service |
| <a name="output_ecs_service_cluster"></a> [ecs\_service\_cluster](#output\_ecs\_service\_cluster) | Amazon Resource Name (ARN) of cluster which the service runs on |
| <a name="output_ecs_service_desired_count"></a> [ecs\_service\_desired\_count](#output\_ecs\_service\_desired\_count) | Number of instances of the task definition |
<!-- END_TF_DOCS -->