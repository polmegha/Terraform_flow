resource_group_name = "rg-dev-001"
location = "centralindia"

vnet_name            = "vnet-dev-001"
vnet_address_space   = ["10.10.0.0/16"]

subnet_name           = "subnet-dev-001"
subnet_address_prefix = ["10.10.1.0/24"]

tags = {
  Environment = "Dev"
  Project     = "PIP"
  Owner       = "Megha"
}
