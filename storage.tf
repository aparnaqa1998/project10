resource "azurerm_storage_account" "storageOne" {
   name                     = "20240229111111"
   resource_group_name      = azurerm_resource_group.resourcegroup.name
   location                 = azurerm_resource_group.resourcegroup.location
   account_tier             = "Standard"
   account_replication_type = "LRS"

   tags = {
     environment = "staging"
   }
 }