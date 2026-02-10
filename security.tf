# Secure Authentication (Managed Identity)

resource "azurerm_user_assigned_identity" "uami" {
  name                = "uami-dev-001"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}
