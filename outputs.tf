output "resource_group_name" {
  value = azurerm_resource_group.resourcegroup.name
}

output "storage_account_name" {
  value = azurerm_storage_account.storageOne.name
}

output "location" {
  value = azurerm_resource_group.resourcegroup.location
}
