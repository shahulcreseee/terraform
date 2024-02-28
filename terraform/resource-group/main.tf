resource "azurerm_resource_group" "rgs" {
  for_each = local.resource_groups
  
  name     = each.value.name
  location = each.value.location
  tags     = merge(local.rg_default_args.tags, each.value.tags)
}
