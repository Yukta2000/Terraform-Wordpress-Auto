module "network"{
 source = "./network"
}

module "vm"{
 rg_name = module.network.rg_name
 rg_location = module.network.rg_location
 nic_id = module.network.nic_id
 source = "./vm"
}

module "mysql"{
 rg_name = module.network.rg_name
 rg_location = module.network.rg_location
 source = "./mysql"
}


resource "null_resource" "azvm_key" {
	provisioner "local-exec" {
               command = "echo '${module.vm.azurevm_private_key}'> ${var.key_path}/keyfiles/azvm.pem"

	    
	}

    }
