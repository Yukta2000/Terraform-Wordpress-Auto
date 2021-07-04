
output "wp_admin_data"{
  sensitive = true
  value = var.os_profile_data
}

output "azurevm_private_key" { 
    value = tls_private_key.example_ssh.private_key_pem 
    sensitive = true
}

