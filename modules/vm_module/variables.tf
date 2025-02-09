variable "resource_group_name" {}
variable "location" {}
variable "vnet_name" {}
variable "subnet_name" {}
variable "admin_username" {}
variable "admin_ssh_key" {}

# Define VMs as a map (key-value pairs)
variable "vms" {
  type = map(object({
    name    = string
    vm_size = string
  }))
}

