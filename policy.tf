resource "azurerm_policy_assignment" "tagging" {
  name                 = "enforce-tagging"
  scope                = azurerm_resource_group.resourcegroup.id
  policy_definition_id = data.azurerm_policy_definition.tagging.id
  parameters           = jsonencode({
    tagName = {
      value = "Environment"
    }
  })
  description          = "This policy ensures that all resources are tagged with 'Environment'."
  display_name         = "Enforce Tagging Policy"
  depends_on           = [azurerm_resource_group.resourcegroup]
}

data "azurerm_policy_definition" "tagging" {
  display_name = "Require a tag on resources"
}