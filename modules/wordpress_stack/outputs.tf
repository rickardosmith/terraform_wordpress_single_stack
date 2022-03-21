output "aws_ec2_instance_public_dns" {
  value = [
    for id, instance in aws_instance.this : "${id} - http://${instance.public_dns}"
  ]

  description = "EC2 Instance Public DNS"
}