output "azure_ip"{
 value = module.network.vm_public_ip
}

output "os_user"{
 sensitive = true
 value = module.vm.wp_admin_data.admin_username
}

output "os_key"{
  sensitive = true
  value = "${var.key_path}/keyfiles/azvm.pem"
}

output "db_endpoint"{
 sensitive = true
 value = module.mysql.db_endpoint
}

output "db_name"{
 sensitive = true
 value = module.mysql.db_name
}

output "db_username"{
 sensitive = true
 value = module.mysql.db_username
}

output "db_password"{
 sensitive = true
 value = module.mysql.db_password
}


