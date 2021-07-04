data "template_file" "azivt"{
  
  template = "${file("${path.module}/ip.tpl")}"
  vars = {
    azvm_public_ip = var.os_public_ip
    azvm_user = var.os_user
    azvm_key_path = var.os_key
    
      }
  } 


resource "null_resource" "azure_ansible_inventory" {
	depends_on = [data.template_file.azivt]
        
	provisioner "local-exec" {
               
               command = "echo '${data.template_file.azivt.rendered}' > ${path.module}/ip.txt"
  
	}

    }


data "template_file" "wpcnf"{
  
  template = "${file("${path.module}/wp-config.tpl")}"
  vars = {
     db_name = var.db_name
     db_user = var.db_username
     db_password = var.db_password
     db_host = var.db_endpoint
    
      }
  } 

resource "local_file" "az_wpcnf" {
     content = data.template_file.wpcnf.rendered
     filename = "${path.module}/wp-config.php"
               
    }


resource "null_resource" "wordpress_configure" {
	depends_on = [null_resource.azure_ansible_inventory,local_file.az_wpcnf]
	provisioner "local-exec" {
            command = "ansible-playbook ${path.module}/wordpress_configure.yml"
	    
	}

    }



