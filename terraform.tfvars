vpc_name = "Main"
vpc_cidr = "10.1.0.0/16"

environment   = "Staging"
instance_type = "t2.micro"

remote_access_cidr = ["1.2.3.4/32"]

clients = [
  {
    name   = "Client A"
    region = "us-east-1"
  },
  {
    name   = "Client B"
    region = "ca-central-1"
  },
  {
    name   = "Client C"
    region = "ca-central-1"
  }
]