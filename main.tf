module "vm" {
  source              = "./modules/vm_module"
  resource_group_name = var.resource_group_name
  location           = var.location
  vnet_name         = var.vnet_name
  subnet_name       = var.subnet_name
  admin_username    = var.admin_username
  admin_ssh_key     = var.admin_ssh_key
  vms               = var.vms
}

