module "us" {
  source = "./modules/wordpress_stack"
  providers = {
    aws = aws.us
  }

  vpc_cidr    = var.vpc_cidr
  vpc_name    = "${var.vpc_name}-us"
  vpc_tenancy = var.vpc_tenancy

  environment        = var.environment
  remote_access_cidr = var.remote_access_cidr

  clients = [for client in var.clients : client.name if client.region == "us-east-1"]

  instance_type = var.instance_type
}

# module "ca" {
#   source = "./modules/wordpress_stack"
#   providers = {
#     aws = aws.ca
#   }

#   vpc_cidr    = var.vpc_cidr
#   vpc_name    = "${var.vpc_name}-ca"
#   vpc_tenancy = var.vpc_tenancy

#   remote_access_cidr = var.remote_access_cidr

#   clients = [for client in var.clients : client.name if client.region == "ca-central-1"]
# }
