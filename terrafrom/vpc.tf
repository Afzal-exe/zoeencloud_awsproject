# Configure the AWS provider
provider "aws" {
  region = var.region 
}

# VPC resource
resource "aws_vpc" "app_vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = true

  tags = {
    Name = var.vpc_name
  }
}

# Internet Gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.app_vpc.id

  tags = {
    Name = var.internet_gateway_name
  }
}

# public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.app_vpc.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.availability_zone1

  tags = {
    Name = var.public_subnet_name
  }
}

# Private subnet 1
resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.app_vpc.id
  cidr_block        = var.ec2_subnet_cidr
  availability_zone = var.availability_zone1

  tags = {
    Name = var.ec2_private_subnet_name
  }
}

# Private subnet 2
resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.app_vpc.id
  cidr_block        = var.rds_subnet_cidr
  availability_zone = var.availability_zone2

  tags = {
    Name = var.rds_private_subnet_name
  }
}

# Route Tables
resource "aws_route_table" "private_route_table1" {
  vpc_id = aws_vpc.app_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  depends_on = [
    aws_nat_gateway.nat_gateway,
  ]
  tags = {
    Name = var.ec2_priate_rt_name
  }
}

resource "aws_route_table" "private_route_table2" {
  vpc_id = aws_vpc.app_vpc.id

  tags = {
    Name = var.rds_priate_rt_name
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.app_vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "public_subnet_rt"
  }
}


# NAT Gateway 
resource "aws_nat_gateway" "nat_gateway" {
  subnet_id = aws_subnet.public_subnet.id
  allocation_id = aws_eip.nat_eip.id

  depends_on = [
    aws_internet_gateway.internet_gateway,
  ]

  tags = {
    Name = var.nat_gateway_name
  }
}

# Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = var.domain

  tags = {
    Name = var.eip_name
  }
}

# Route for internet access through NAT Gateway 
resource "aws_route" "nat_gateway_route" {
  route_table_id         = aws_route_table.private_route_table1.id
  destination_cidr_block = var.destination_cidr_block
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}


# Associate private subnets with their respective route tables
resource "aws_route_table_association" "private_subnet_association1" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_route_table1.id
}

resource "aws_route_table_association" "private_subnet_association2" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_route_table2.id
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

