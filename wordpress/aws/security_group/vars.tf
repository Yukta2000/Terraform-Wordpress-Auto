variable "aws_vpc_id"{
    type = string
    default = "vpc-6b2ef516"
}

variable "sg"{
   default = [{ port = 22
               protocol = "tcp"
              },
	      { port = 80
	        protocol = "tcp"
		} ]
  }
