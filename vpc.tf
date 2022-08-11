resource "aws_vpc" "elk_vpc" {
  cidr_block = var.vpc_cidr
  
  tags = {
    Name = var.vpc_name
  }
}


resource "aws_eip" "elastic_ip" {
  vpc = true
}


