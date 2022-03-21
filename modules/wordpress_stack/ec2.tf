# Bitnami AMI
# WordPress Stack
data "aws_ami" "bitnami_wordpress" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-wordpress-5.*linux-debian-10-x86_64-hvm-ebs-nami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Canonical
}

#tfsec:ignore:aws-ec2-enforce-http-token-imds
#tfsec:ignore:aws-vpc-no-public-egress-sg
resource "aws_instance" "this" {
  for_each = { for idx, client in var.clients : client => idx }

  ami           = data.aws_ami.bitnami_wordpress.id
  instance_type = var.instance_type

  disable_api_termination = false

  network_interface {
    network_interface_id = aws_network_interface.public_nic[each.value].id
    device_index         = 0
  }

  root_block_device {
    volume_type = "gp3"
    volume_size = 20
    encrypted   = true
  }

  tags = {
    Name = replace(lower("${each.key}-${var.environment}"), " ", "-")
  }
}
