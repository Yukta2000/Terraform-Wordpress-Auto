
resource "aws_instance" "wordpress" {
    
  ami           = var.aws_ami_id
  instance_type = "t2.micro"
  key_name = var.aws_key_name
  security_groups = [var.security_group]
  tags={
      Name = "Wordpress_Instance"
  }
  
}


