resource "azurerm_role_assignment" "example" {
  scope                = azurerm_resource_group.resourcegroup.id
  role_definition_name = "Contributor"
  principal_id         = var.user_object_id
}