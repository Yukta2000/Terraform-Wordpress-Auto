
[terraform_wordpress]
${azvm_public_ip} ansible_user="azureuser" ansible_ssh_private_key=${azvm_key_path} ansible_connection=ssh

