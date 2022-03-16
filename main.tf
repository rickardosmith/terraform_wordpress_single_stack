module "us" {
  source = "./modules/wordpress_stack"
  providers = {
    aws = aws.us
  }

  vpc_cidr    = var.vpc_cidr
  vpc_name    = "${var.vpc_name}-us"
  vpc_tenancy = var.vpc_tenancy

  clients = [for client in var.clients : client.name if client.region == "us-east-1"]
}

module "ca" {
  source = "./modules/wordpress_stack"
  providers = {
    aws = aws.ca
  }

  vpc_cidr    = var.vpc_cidr
  vpc_name    = "${var.vpc_name}-ca"
  vpc_tenancy = var.vpc_tenancy

  clients = [for client in var.clients : client.name if client.region == "ca-central-1"]
}
