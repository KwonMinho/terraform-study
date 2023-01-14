provider "aws" {
    region = "us-east-2"
}

// Below document for aws_instace arg 
//https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance.html
resource "aws_instance" "ec2-server" {
    // AWS MACHINE ID
    ami = "ami-0c55b159cbfafe1f0"

    instance_type = "t2.micro"

    // 표현식-참조(reference)
    // <PROVIDER_TYPE>.<NAME>.<ATTRIBUTE>
    vpc_security_group_ids = [aws_security_group.sg1.id]

    user_data = <<-EOF
                    #! /bin/bash
                    echo "Hellow Terraform" > index.html
                    nohup busybox httpd -f -p 8080 &
                   EOF

    tags = {
        Name = "terraform-practice"
    }
}

resource "aws_security_group" "sg1" {
    name = "terraform-example-instance"

    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
