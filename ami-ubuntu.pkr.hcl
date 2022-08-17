packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "Elasticsearch" {
  ami_name          = "Elasticsearch"
  instance_type     = "t2.small"
  region            = "ap-southeast-2"
  vpc_id            = "vpc-0e10c8b1a8c364721"
  subnet_id         = "subnet-0fd3a69d65a8fc39a"
  security_group_id = "sg-03d103958605ddbb0"

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
  tags = {
      "Name" = "elasticsearch-Server"
    }
     deprecate_at = timeadd(timestamp(), "8766h")
}

build {
  name = "elasticsearch-packer"

  sources = [
    "source.amazon-ebs.Elasticsearch"
  ]


    // provisioner "ansible" {
    //   playbook_file = "./playbooks/apache2.yml"
    // }
}
source "amazon-ebs" "logstach" {
  ami_name          = "logstach"
  instance_type     = "t2.small"
  region            = "ap-southeast-2"
  vpc_id            = "vpc-0e10c8b1a8c364721"
  subnet_id         = "subnet-0fd3a69d65a8fc39a"
  security_group_id = "sg-03d103958605ddbb0"


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
  tags = {
      "Name" = "logstach-Server"
    }
}

build {
  name = "logstach-packer"

  sources = [
    "source.amazon-ebs.logstach"
  ]


    // provisioner "ansible" {
    //   playbook_file = "./playbooks/apache2.yml"
    // }
}


source "amazon-ebs" "kibana" {
  ami_name          = "kibana"
  instance_type     = "t2.small"
  region            = "ap-southeast-2"
  vpc_id            = "vpc-0e10c8b1a8c364721"
  subnet_id         = "subnet-0fd3a69d65a8fc39a"
  security_group_id = "sg-03d103958605ddbb0"

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
  tags = {
      "Name" = "kibana-Server"
    }
     deprecate_at = timeadd(timestamp(), "8766h")
}

build {
  name = "kibana-packer"

  sources = [
    "source.amazon-ebs.kibana"
  ]


    // provisioner "ansible" {
    //   playbook_file = "./playbooks/apache2.yml"
    // }
}