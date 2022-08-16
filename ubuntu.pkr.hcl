packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}


source "amazon-ebs" "ubuntu" {
  ami_name      = "lab_ami-${local.timestamp}"
  instance_type = "t2.micro"
  region        = "ap-southeast-2"
  vpc_id        = "vpc-02389fb198f6715e0"
  subnet_id     = "subnet-0772156c18d6a8012"
  security_group_id = "sg-06543ca96b9e68aa5"
  deprecate_at  = "2023-07-29T23:59:59Z"
  //ssh_timeout = "20m"



  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
      #name = "AMI-BUILD-Blue-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

build {
  name = "learn-packer"
    
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
 

  provisioner "ansible" {
    playbook_file = "./playbooks/apache2.yml"
  }
}