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
resource "aws_instance" "staging" {
  count = length(var.clients)

  ami           = data.aws_ami.bitnami_wordpress.id
  instance_type = "t2.micro"

  disable_api_termination = false

  network_interface {
    network_interface_id = aws_network_interface.public_nic_stage[count.index].id
    device_index         = 0
  }

  root_block_device {
    volume_type = "gp3"
    volume_size = 20
    encrypted   = true
  }

  tags = {
    Name = replace(lower("${var.clients[count.index]}-staging"), " ", "-")
  }
}

# resource "aws_instance" "production" {
#   count = length(var.clients)

#   ami           = data.aws_ami.bitnami_wordpress.id
#   instance_type = "t2.medium"

#   disable_api_termination = false

#   network_interface {
#     network_interface_id = aws_network_interface.public_nic_prod[count.index].id
#     device_index         = 0
#   }

#   metadata_options {
#     http_tokens   = "required"
#     http_endpoint = "disabled"
#   }

#   root_block_device {
#     volume_type = "gp3"
#     volume_size = 20
#     encrypted   = true
#   }

#   tags = {
#     Name = replace(lower("${var.clients[count.index]}-production"), " ", "-")
#   }
# }