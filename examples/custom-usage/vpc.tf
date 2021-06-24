locals {
  tags = {
    Name = "custom-example"
  }
}

## Create a VPC
resource "aws_vpc" "main" {
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = true
  cidr_block                       = "10.100.0.0/16"
  tags                             = local.tags
}

## Create one subnet in AZ a
resource "aws_subnet" "aza" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.100.1.0/24"
  availability_zone = "eu-west-1a"
  tags              = local.tags
}

## Create one subnet in AZ b
resource "aws_subnet" "azb" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.100.2.0/24"
  availability_zone = "eu-west-1b"
  tags              = local.tags
}

## Create a security group
resource "aws_security_group" "sg" {
  name        = local.tags["Name"]
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = local.tags
}
