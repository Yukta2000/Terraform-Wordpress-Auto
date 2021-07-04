output "db_endpoint"{
 value = aws_db_instance.wordpress_db.endpoint
}

output "db_password"{
value = var.db_password
sensitive = true
}

output "db_name"{
 value = aws_db_instance.wordpress_db.name
}

output "db_username"{
 value = var.db_username
}


