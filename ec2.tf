resource "aws_instance" "airbnb-web" {
  ami           =var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "airbnb-web-server"
  }
}

resource "aws_instance" "airbnb-prod" {
  ami           =var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "airbnb-prod-server"
  }
}