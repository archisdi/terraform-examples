provider "aws" {
    region = "us-west-2"
    access_key = var.access_key
    secret_key = var.secret_key
}

resource "aws_instance" "ec2-example" {
    ami = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
    tags = {
        Name = "terraform-example"
    }

    # user_data = <<-EOF // user data is a native way to run scripts on the instance.
    #     #!/bin/bash
    #     sudo apt-get update
    #     sudo apt-get install -y nginx
    #     sudo systemctl enable nginx
    #     sudo systemctl start nginx
    #     EOF

    provisioner "remote-exec" { // this will be used to execute commands on the instance
        inline = [
            "sudo apt-get update",
            "sudo apt-get install -y nginx",
            "sudo systemctl enable nginx",
            "sudo systemctl start nginx"
        ]
    }
    connection { // this will be used to connect to the instance
        type = "ssh"
        user = "ubuntu"
        private_key = file("~/.ssh/id_rsa")
        host = self.public_ip
    }

    provisioner "local-exec" { // this will be used to execute commands on the local machine
      # on_failure = fail // default behavior
      # when = create // default behavior

      on_failure = continue
      command = "echo ${self.public_ip} > ip_address.txt"
    }

    provisioner "local-exec" {
      when = destroy
      command = "echo 'The instance ${self.public_ip} is being destroyed' > instance_destroyed.txt"
    }

    key_name = aws_key_pair.default.key_name
    vpc_security_group_ids = [aws_security_group.ssh-access.id]
}

resource "aws_key_pair" "default" {
    key_name = "terraform-key"
    public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "ssh-access" {
    name = "ssh-access"
    description = "Allow SSH access"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

output "public_ip" {
    value = aws_instance.ec2-example.public_ip
}