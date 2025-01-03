#key-pair
resource "aws_key_pair" "example" {
    key_name = "terrakey"
    public_key = file("C:/Users/Admin/Documents/Terraform Programs/Terraform-practice/terra-key.pub")
}

#vpc
resource "aws_default_vpc" "my-vpc" {
  
}

#security-group
resource "aws_security_group" "my-sg" {
    name = "my-sg"
    description = "this is my security group to open ports for ec2"
    vpc_id = aws_default_vpc.my-vpc.id  #interpolation - using internal resources using references

    #ingress - inbound - incoming traffic
    ingress {
        description = "this is for ssh"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    #egress - outbound - outgoing traffic
    egress {
        description = "this is for outgoing internet"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "my-instance" {
    ami = var.ami-id
    instance_type = "t2.micro"
    key_name = aws_key_pair.example.key_name
    security_groups = [aws_security_group.my-sg.name]
    tags = {
        Name = "terra-automate"
    }
}