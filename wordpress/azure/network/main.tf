resource "azurerm_resource_group" "wp_rg"{
  name = "wordpress"
  location = var.rg_location
}

resource "azurerm_virtual_network" "wp_vn"{
  name = "wp_vn"
  address_space = var.vn_address_space
  location = azurerm_resource_group.wp_rg.location
  resource_group_name = azurerm_resource_group.wp_rg.name
}

resource "azurerm_subnet" "wp_subnet"{
  name = "wp_subnet"
  resource_group_name = azurerm_resource_group.wp_rg.name
  virtual_network_name = azurerm_virtual_network.wp_vn.name
  address_prefixes = var.subnet_address_prefixes
}

resource "azurerm_public_ip" "wp_vm_publicip"{
   name = "pip1"
   location = azurerm_resource_group.wp_rg.location
   resource_group_name = azurerm_resource_group.wp_rg.name
   allocation_method = "Dynamic"
   sku = "Basic"
}

resource "azurerm_network_security_group" "wp_sg" {
    name                = "tf-wp-sg"
    location            = azurerm_resource_group.wp_rg.location
    resource_group_name = azurerm_resource_group.wp_rg.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
    
    security_rule {
        name                       = "HTTP"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags = {
        environment = "test"
    }
}
resource "azurerm_network_interface" "wp_nic" {
  name                = "wp_nic"
  location            = azurerm_resource_group.wp_rg.location
  resource_group_name = azurerm_resource_group.wp_rg.name

  ip_configuration {
    name                          = "wp_network"
    subnet_id                     = azurerm_subnet.wp_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.wp_vm_publicip.id
  }
}

resource "azurerm_network_interface_security_group_association" "example" {
    network_interface_id      = azurerm_network_interface.wp_nic.id
    network_security_group_id = azurerm_network_security_group.wp_sg.id
}


