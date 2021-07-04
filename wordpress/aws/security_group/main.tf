resource "aws_security_group" "allow_tcp"{
    name = "wordpress_ec2_instance"
    description = "allow port 8080"
    vpc_id = var.aws_vpc_id

    dynamic ingress{
        for_each = [for r in var.sg: {
		port = r.port
		protocol = r.protocol
	           }]
          content{
		from_port = ingress.value.port
        	to_port = ingress.value.port
        	protocol = ingress.value.protocol
        	cidr_blocks = ["0.0.0.0/0"]
        	ipv6_cidr_blocks = ["::/0"]
                  }     

        }
      
      egress{
        
		from_port = 0
        	to_port = 0
        	protocol = "-1"
        	cidr_blocks = ["0.0.0.0/0"]
        	ipv6_cidr_blocks = ["::/0"]   

        }
     }
