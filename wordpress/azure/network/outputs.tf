output "rg_name"{
 value = azurerm_resource_group.wp_rg.name
}

output "rg_location"{
 value = azurerm_resource_group.wp_rg.location
}

output "nic_id"{
 value = azurerm_network_interface.wp_nic.id
}

output "vm_public_ip"{
 value = azurerm_public_ip.wp_vm_publicip.ip_address
}
