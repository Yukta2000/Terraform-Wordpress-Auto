variable "aws_ami_id" {
    default = "ami-0aeeebd8d2ab47354"
    type = string
}
variable "aws_vpc_id"{
    type = string
    default = "vpc-6b2ef516"
}
 variable "aws_key_name"{
     type = string
     default = "new_aws_key"
 }

variable "security_group"{
 default = "test"
}
