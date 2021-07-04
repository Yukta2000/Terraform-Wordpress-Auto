
[terraform_wordpress]
${aws_instance_public_ip} ansible_user=ec2-user ansible_ssh_private_key_file=${aws_wordpress_key_path} ansible_connection=ssh

