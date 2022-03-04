provider "aws" {
  region = var.region
}

resource "aws_instance" "webserver1" {
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.sghttp.id, aws_security_group.sgssh.id]
}

resource "aws_instance" "webserver2" {
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.sghttp.id, aws_security_group.sgssh.id]

}

resource "aws_security_group" "sghttp" {
  name        = "allow_http"
  description = "Allow inbound traffic"

  ingress {
    description      = "http from Internet"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "sgssh" {
    name = "ssh-access"
    description = "allow SSH access from the Internet"

    ingress {
    description      = "SSH from Local"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }
}