#public subnet
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.elk_vpc.id
  cidr_block = var.cidr_public
  availability_zone = "ap-southeast-2a"

  tags = {
    Name = "Kibana"
  }
}

#private subnet
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.elk_vpc.id
  cidr_block = var.cidr_private
  availability_zone = "ap-southeast-2a"

  tags = {
    Name = "Monitoring"
  }
}

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.elk_vpc.id
  cidr_block = var.cidr_private1
  availability_zone = "ap-southeast-2a"

  tags = {
    Name = "Application_demo1"
  }
}
resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.elk_vpc.id
  cidr_block = var.cidr_private2
  availability_zone = "ap-southeast-2b"
  tags = {
    Name = "Application_demo2"
  }
}
resource "aws_subnet" "private3" {
  vpc_id     = aws_vpc.elk_vpc.id
  cidr_block = var.cidr_private3
  availability_zone = "ap-southeast-2c"
  tags = {
    Name = "Application_demo3"
  }
}