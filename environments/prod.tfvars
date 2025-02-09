resource_group_name = "prod-rg"
location           = "West US"
vnet_name         = "prod-vnet"
subnet_name       = "prod-subnet"
admin_username    = "adminuser"
admin_ssh_key     = ""  # Will be dynamically injected from Jenkins

# Multiple VMs
vms = {
  "vm1" = { name = "prod-vm1", vm_size = "Standard_DS2_v2" }
  "vm2" = { name = "prod-vm2", vm_size = "Standard_DS3_v2" }
  "vm3" = { name = "prod-vm3", vm_size = "Standard_DS4_v2" }
}

