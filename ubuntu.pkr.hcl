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
  ami_name          = "lab_ami-${local.timestamp}"
  instance_type     = "t2.micro"
  region            = "ap-southeast-2"
  vpc_id            = "	vpc-0b6a4c77ad2667add"
  subnet_id         = "	subnet-00b0a299abdb24ff0"
  security_group_id = "sg-026063778d404ee96"






  source_ami_filter {
    filters = {
      name = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"

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


    // provisioner "ansible" {
    //   playbook_file = "./playbooks/apache2.yml"
    // }
}