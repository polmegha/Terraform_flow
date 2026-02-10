#backend configuration
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-dev-001"
    storage_account_name = "tfrgdev001"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
    use_azuread_auth     = true
  }
}