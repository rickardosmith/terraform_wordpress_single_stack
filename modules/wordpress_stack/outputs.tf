output "aws_instance_staging_public_dns" {
  value       = aws_instance.staging.*.public_dns
  description = "Staging Instance Public DNS"
}

# output "aws_instance_production" {
#   value       = aws_instance.production.*.id
#   description = "Production Instance IDs"
# }