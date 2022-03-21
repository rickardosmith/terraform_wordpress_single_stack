vpc_name = "Main"
vpc_cidr = "10.1.0.0/16"

remote_access_cidr = ["72.53.208.173/32"]

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