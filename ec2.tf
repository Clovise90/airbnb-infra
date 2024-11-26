resource "aws_instance" "airbnb-web" {
  ami           =var.ami_id
  instance_type = var.instance_type
  monitoring = true
  ebs_optimized = true

  tags = {
    Name = "airbnb-web-server"
  }
}

resource "aws_instance" "airbnb-prod" {
  ami           =var.ami_id
  instance_type = var.instance_type
  monitoring = true
  ebs_optimized = true

  tags = {
    Name = "airbnb-prod-server"
  }
}