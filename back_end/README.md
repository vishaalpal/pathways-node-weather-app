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
| <a name="module_ecr"></a> [ecr](#module\_ecr) | ./modules/aws/ecr | n/a |
| <a name="module_iam"></a> [iam](#module\_iam) | ./modules/aws/iam | n/a |
| <a name="module_sg"></a> [sg](#module\_sg) | ./modules/aws/iam | n/a |

<!-- ## Resources

No resources. -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_set_username_prefix"></a> [set\_username\_prefix](#input\_set\_username\_prefix) | Name to be used on all the resources as identifier | `string` | null | yes |
| <a name="input_set_custom_tags"></a> [set\_custom\_tags](#input\_set\_custom\_tags) | Use tags to identify project resources | <pre>map(string){<br>  Student_Name = string<br>  Project_name = string<br>  Pathway = string<br>}</pre> | null | yes |
| <a name="input_set_ecr_repo_name"></a> [set\_ecr\_repo\_name](#input\_set\_ecr\_repo\_name) | Specifies the name of the ECR repository | `string` | null | yes |
| <a name="input_alb_sg_name"></a> [alb\_sg\_name](#input\_alb\_sg\_name) | The name of the security group | `string` | null | yes |
| <a name="input_alb_sg_description"></a> [alb\_sg\_description](#input\_alb\_sg\_description) | The description of the security group | `string` | null | yes |
| <a name="input_alb_ingress_rules"></a> [alb\_ingress\_rules](#input\_alb\_ingress\_rules) | Specifies ingress rules for a security group | <pre>list(object({<br>  from = number<br>  to = number<br>  protocol = string<br>  cidr = list(string)<br>})) | null | 
| <a name="input_alb_egress_rules"></a> [alb\_egress\_rules](#input\_alb\_egress\_rules) | Specifies egress rules for a security group | <pre>list(object({<br>  from = number<br>  to = number<br>  protocol = string<br>  cidr = list(string)<br>})) | null | yes |
| <a name="input_ecs_sg_name"></a> [ecs\_sg\_name](#input\_ecs\_sg\_name) | The name of the security group | `string` | null | yes |
| <a name="input_ecs_sg_description"></a> [ecs\_sg\_description](#input\_ecs\_sg\_description) | The description of the security group | `string` | null | yes |
| <a name="input_ecs_sg_name"></a> [ecs\_sg\_name](#input\_ecs\_sg\_name) | The name of the security group | `string` | null | yes |
| <a name="input_ecs_egress_rules"></a> [ecs\_egress\_rules](#input\_ecs\_egress\_rules) | Specifies egress rules for a security group | <pre>list(object({<br>  from = number<br>  to = number<br>  protocol = string<br>  cidr = list(string)<br>})) | null | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_policy_id"></a> [iam\_policy\_id](#output\_iam\_policy\_id) | The name of the IAM policy |
| <a name="output_iam_role_id"></a> [iam\_role\_id](#output\_iam\_role\_id) | The name of the IAM role |
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | Amazon Resource Name (ARN) specifying the role |
| <a name="output_alb_sg_id"></a> [alb\_sg\_id](#output\_alb\_sg\_id) | The ID of the security group |
| <a name="output_ecs_sg_id"></a> [ecs\_sg\_id](#output\_ecs\_sg\_id) | The ID of the security group |
| <a name="output_ecr_repo_registry_id"></a> [ecr\_repo\_registry\_id](#output\_ecr\_repo\_registry\_id) | The registry ID where the repository was created |
| <a name="output_ecr_repo_repository_url"></a> [ecr\_repo\_repository\_url](#output\_ecr\_repo\_repository\_url) | The URL of the repository (in the form |
<!-- END_TF_DOCS -->