module "sg"{
   source = "./security_group"
}


module "ec2"{
   source = "./ec2"
   
   security_group = module.sg.security_group
}



module "rds" {
   source = "./rds"
}

