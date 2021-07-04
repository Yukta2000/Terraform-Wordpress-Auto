resource "tls_private_key" "example_ssh" {
  algorithm = "RSA"
  rsa_bits = 4096
}


resource "azurerm_linux_virtual_machine" "wp_vm" {
  name                  = "wordpress-host"
  location              = var.rg_location
  resource_group_name   = var.rg_name
  network_interface_ids = [var.nic_id]
  size               = var.az_vm_size

  plan{
     name = var.plan_details.name
     product = var.plan_details.product
     publisher = var.plan_details.publisher
}
  source_image_reference {
    publisher = var.str_img_ref.publisher
    offer     = var.str_img_ref.offer
    sku       = var.str_img_ref.sku
    version   = var.str_img_ref.version
  }
  os_disk {
    name              = "wp_disk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  
    computer_name  = var.os_profile_data.computer_name
    admin_username = var.os_profile_data.admin_username
    disable_password_authentication = true

  /* Create key using ssh-keygen in linux and make changes*/
   admin_ssh_key {
        username       = "azureuser"
        public_key     = file("~/.ssh/azkey.pub")
    }
  tags = {
    environment = "test"
  }
}
