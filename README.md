# WordPress Stack
Demonstration of creating an EC2 instance hosting a WordPress Stack

# How to run
Update the `terraform.tfvars` file to your liking and run the terraform commands as per usual; 
*   `terraform init`
*   `terraform plan`
*   `tarraform apply`


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_us"></a> [us](#module\_us) | ./modules/wordpress_stack | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_clients"></a> [clients](#input\_clients) | Client list | `list(map(string))` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type | `string` | `"t2.micro"` | no |
| <a name="input_remote_access_cidr"></a> [remote\_access\_cidr](#input\_remote\_access\_cidr) | A list of IP address to allow for remote access | `list(any)` | `[]` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | VPC CIDR | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC name | `string` | n/a | yes |
| <a name="input_vpc_tenancy"></a> [vpc\_tenancy](#input\_vpc\_tenancy) | VPC tenancy | `string` | `"default"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_us_region_ec2_instance_public_dns"></a> [us\_region\_ec2\_instance\_public\_dns](#output\_us\_region\_ec2\_instance\_public\_dns) | EC2 Instance Public DNS |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
