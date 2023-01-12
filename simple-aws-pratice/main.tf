provider "aws" {
    region = "us-east-2"
}

// Below document for aws_instace arg 
//https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance.html
resource "aws_instance" "ec2-server" {
    // AWS MACHINE ID
    ami = "ami-0c55b159cbfafe1f0"

    instance_type = "t2.micro"

    tags = {
        Name = "terraform-practice"
    }
}

