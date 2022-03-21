output "us_region_staging_instance_public_dns" {
  value       = [for instance in module.us.aws_instance_staging_public_dns : "http://${instance}}"]
  description = "Staging Instance Public DNS"
}

# output "us_region_production_instance_name" {
#   value       = module.us.aws_instance_production
#   description = "Production Instance Name"
# }

