resource "azurerm_mysql_server" "sql_server"{
  name = "tf-wp-mysql"
  resource_group_name = var.rg_name
  location = var.rg_location
  sku_name = "B_Gen5_2"
  storage_mb = 5120
  version = "5.7"
  administrator_login = var.login
  administrator_login_password = var.password
  public_network_access_enabled = true
  ssl_enforcement_enabled = false
}

resource "azurerm_mysql_firewall_rule" "wp_db"{
   name = "tf-Wp-mysql"
   resource_group_name = var.rg_name
   server_name = azurerm_mysql_server.sql_server.name
   start_ip_address = "0.0.0.0"
   end_ip_address = "0.0.0.0"
}

resource "azurerm_mysql_database" "wp_db"{
  name = "tf-wp_db"
  resource_group_name = var.rg_name
  server_name = azurerm_mysql_server.sql_server.name
  charset = "utf8"
  collation = "utf8_unicode_ci"
}    
