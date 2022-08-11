resource "aws_vpc" "elk_vpc" {
  cidr_block = var.vpc_cidr
  
  tags = {
    Name = var.vpc_name
  }
}
# resource "aws_internet_gateway" "internetgw" {
#   vpc_id = aws_vpc.elk_vpc

#   tags = {
#     Name = internetgw
#   }
# }

resource "aws_eip" "elastic_ip" {
  vpc = true
}


# resource "aws_nat_gateway" "Nat_gw" {
#   allocation_id = aws_eip.elastic_ip
#   subnet_id     = aws_subnet.public.id

#   tags = {
#     Name = "Nat_gw"
#   }

#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   depends_on = [aws_internet_gateway.internetgw]
# }