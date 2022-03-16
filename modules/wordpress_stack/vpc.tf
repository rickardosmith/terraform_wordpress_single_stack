data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = var.vpc_tenancy
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = lower("${var.vpc_name}")
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

resource "aws_subnet" "public" {

  count             = length(cidrsubnets(var.vpc_cidr, [for i in range(3) : 8]...))
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnets(var.vpc_cidr, [for i in range(3) : 8]...)[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index % length(data.aws_availability_zones.available.names)]

  map_public_ip_on_launch = true
  depends_on = [
    aws_internet_gateway.main
  ]
}

resource "aws_route_table_association" "public_rta" {
  count          = length(cidrsubnets(var.vpc_cidr, [for i in range(3) : 8]...))
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_network_interface" "public_nic_stage" {
  count = length(var.clients)

  subnet_id = aws_subnet.public[count.index%length(cidrsubnets(var.vpc_cidr, [for i in range(3) : 8]...))].id
}

resource "aws_network_interface" "public_nic_prod" {
  count = length(var.clients)

  subnet_id = aws_subnet.public[count.index%length(cidrsubnets(var.vpc_cidr, [for i in range(3) : 8]...))].id
}

