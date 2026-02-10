variable "resource_group_name" {}
variable "location" {}

variable "vnet_name" {}
variable "vnet_address_space" {}

variable "subnet_name" {}
variable "subnet_address_prefix" {}

variable "tags" {
  type = map(string)
}
# variable "vm_admin_password" {
#   type      = string
#   sensitive = true
# }