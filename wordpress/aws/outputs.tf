
output "db_endpoint"{
 value = module.rds.db_endpoint
}

output "db_password"{
value = module.rds.db_password
sensitive = true
}

output "db_name"{
 value = module.rds.db_name
}

output "db_username"{
 value = module.rds.db_username
}

output "aws_ip"{
 value = module.ec2.aws_ip
}

output "os_user"{
 value = var.os_user
}

output "os_key"{
 value = "${var.key_path}/${var.os_key}"
}
