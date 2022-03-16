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

resource "aws_instance" "staging" {
  count = length(var.clients)

  ami           = data.aws_ami.bitnami_wordpress.id
  instance_type = "t2.micro"

  disable_api_termination = false

  network_interface {
    network_interface_id = aws_network_interface.public_nic_stage[count.index].id
    device_index         = 0
  }

  tags = {
    Name = replace(lower("${var.clients[count.index]}-staging"), " ", "-")
  }
}

resource "aws_instance" "production" {
  count = length(var.clients)

  ami           = data.aws_ami.bitnami_wordpress.id
  instance_type = "t2.medium"

  disable_api_termination = false

  network_interface {
    network_interface_id = aws_network_interface.public_nic_prod[count.index].id
    device_index         = 0
  }

  tags = {
    Name = replace(lower("${var.clients[count.index]}-production"), " ", "-")
  }
}