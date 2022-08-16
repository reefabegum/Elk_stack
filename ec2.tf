resource "aws_instance" "Kibana_server" {
  ami           = data.aws_ami.elk_ami.id
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.elk_server.id]
  key_name = "elk_key"
  subnet_id = aws_subnet.public.id

  user_data = <<EOF
		#! /bin/bash
        sudo apt-get update
		sudo apt-get install -y kibana
		sudo systemctl start kibana
		sudo systemctl enable kibana
		echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
	EOF
  
  
  tags = {
    Name = "kibana"
  }
}
  resource "aws_eip" "Kibana_eip" {
    instance = aws_instance.Kibana_server.id 
    vpc      = true
  }
