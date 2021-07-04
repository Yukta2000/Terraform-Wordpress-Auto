output "db_endpoint"{
 value = azurerm_mysql_server.sql_server.fqdn
}

output "db_password"{
 sensitive = true
 value = var.password
}

output "db_name"{
 value = azurerm_mysql_database.wp_db.name
}

output "db_username"{
 sensitive = true
 value = "${var.login}@${azurerm_mysql_server.sql_server.name}"
}
