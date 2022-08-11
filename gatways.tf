resource "aws_internet_gateway" "IGW" {
  vpc_id    = aws_vpc.elk_vpc.id

  tags = {
    Name = "IGW"
  }
}


resource "aws_nat_gateway" "NAT_GW" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.public.id
 
 
  tags = {
    Name = "NAT_GW"
  }
  
}