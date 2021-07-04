//Uncomment  to launch on aws
/*module "aws"{
  source = "./aws"
}

module "wp_conf"{
  depends_on = [module.aws]
  source = "./wordpress_config"

  os_user = module.aws.os_user
  os_key = module.aws.os_key
  db_endpoint = module.aws.db_endpoint
  db_password = module.aws.db_password
  db_name     = module.aws.db_name
  db_username = module.aws.db_username
  os_public_ip = module.aws.aws_ip
}
*/

module "azure"{
 source = "./azure"
}


module "wp_conf"{
  depends_on = [module.azure]
  source = "./wordpress_config"
  
  os_user = module.azure.os_user
  os_key = "/root/Documents/keyfiles/azvm.pem"
  db_endpoint = module.azure.db_endpoint
  db_password = module.azure.db_password
  db_name     = module.azure.db_name
  db_username = module.azure.db_username
  os_public_ip = module.azure.azure_ip
}
