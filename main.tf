terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  ##Below details are provided through environment variables##
  ##If below properties are left empty, then terraform will look at environment variables##
  #region     = "<aws_region>"
  #access_key = "<access_id>"
  #secret_key = "<access_secret>"
}

variable "sg" {
  description = "List of Security Group IDs"
  type        = list(string)
  default     = ["sg-05016e5b1b76356b0"]
}

resource "aws_instance" "workstation" {

  ami                    = "ami-0fe630eb857a6ec83"
  instance_type          = "t2.micro"
  key_name               = "id_workstations"
  vpc_security_group_ids = var.sg

  tags = {
    Name = "docker-server"
  }

  provisioner "remote-exec" {

    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = self.public_ip
      private_key = file("${path.module}/id_workstations.pem")
    }

    inline = [
      "sudo yum install -y yum-utils",
      "sudo yum-config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo",
      "sudo yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin",
      "sudo systemctl start docker",
      "sudo docker run hello-world"
    ]
  }
}

output "instance_ip_addr" {
  value       = aws_instance.workstation.public_ip
  description = "This is public IP address of the AWS instance"
}