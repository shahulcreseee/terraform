output "resoucegrp" {
  value = local.resource_groups
}

output "resource-group-names" {
    value = { for p in keys(azurerm_resource_group.rgs) : p => azurerm_resource_group.rgs[p].name }
}