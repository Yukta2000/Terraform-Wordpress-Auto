variable "rg_location"{
  default = "East US"
}

variable "rg_name"{
}

variable "nic_id"{
}

variable "az_vm_size"{
 default = "Standard_B2s"
}

variable "str_img_ref"{
 default = {
            "publisher" = "cognosys"
             "offer" = "php-7-3-with-centos-7-7-free"
             "sku" = "php-7-3-with-centos-7-7-free"
             "version" = "1.2019.1010"

             }
   } 

variable "plan_details"{
  default = {
              "name" = "php-7-3-with-centos-7-7-free"
              "product" = "php-7-3-with-centos-7-7-free"
              "publisher" = "cognosys"
             }
  }

variable "disk_type"{
   default = "Standard_LRS"
}

variable "os_profile_data"{
 sensitive = true
 default = {
         computer_name  = "wordpressHost"
         admin_username = "azureuser"
         
}
}
