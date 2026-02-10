# Azure Policy (Tag Enforcement)
resource "azurerm_policy_definition" "require_tags" {
  name         = "require-tags"
  policy_type = "Custom"
  mode        = "Indexed"
  display_name = "Require mandatory tags"

  policy_rule = jsonencode({
    if = {
      field = "tags"
      exists = "false"
    }
    then = {
      effect = "deny"
    }
  })
}

resource "azurerm_resource_group_policy_assignment" "require_tags_assignment" {
  name                 = "require-tags-assignment"
  resource_group_id    = azurerm_resource_group.rg.id
  policy_definition_id = azurerm_policy_definition.require_tags.id
}

