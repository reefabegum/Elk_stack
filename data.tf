data "aws_ami" "elk_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }


  owners = ["099720109477"] # Canonical
}

