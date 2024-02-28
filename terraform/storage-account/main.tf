resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type

  tags = {
    environment = "development"
  }
}

resource "azurerm_storage_container" "example" {
  count = length(var.storage_account_containers)
  name                  = var.storage_account_containers[count.index].name
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = var.storage_account_containers[count.index].access_type
}