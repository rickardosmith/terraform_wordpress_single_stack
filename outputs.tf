output "us_region_ec2_instance_public_dns" {
  value       = [for instance in module.us.aws_ec2_instance_public_dns : instance]
  description = "EC2 Instance Public DNS"
}
