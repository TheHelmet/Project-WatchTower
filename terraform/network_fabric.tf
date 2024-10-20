resource "aws_vpc" "vpc" {
  cidr_block = "192.168.100.0/24"

  tags = {
    "project" = var.project
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    "project" = var.project
  }
}

resource "aws_subnet" "subnet" {
  depends_on = [
    aws_internet_gateway.gw
  ]

  vpc_id     = aws_vpc.vpc.id
  cidr_block = "192.168.100.0/24"

  tags = {
    "project" = var.project
  }
}

resource "aws_default_route_table" "route" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    "project" = var.project
  }
}
