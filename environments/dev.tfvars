resource_group_name = "dev-rg"
location           = "East US"
vnet_name         = "dev-vnet"
subnet_name       = "dev-subnet"
admin_username    = "adminuser"
admin_ssh_key     = ""  # This will be dynamically injected from Jenkins

# Multiple VMs
vms = {
  "vm1" = { name = "dev-vm1", vm_size = "Standard_DS1_v2" }
  "vm2" = { name = "dev-vm2", vm_size = "Standard_DS2_v2" }
}

