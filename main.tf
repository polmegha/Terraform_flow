terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
  }
}

provider "azurerm" {
  features {}
}
#RG
resource "azurerm_resource_group" "rg" {
  name     = "rg-dev-001"
  location = "centralindia"
}

# resource "azurerm_resource_group" "rg1" {
#   name     = "rg-dev-002"
#   location = "centralindia"
# }
