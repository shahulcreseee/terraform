terraform {
    source = "../../terraform/storage-account"
}

include "azure_provider" {
    path = find_in_parent_folders("azure_provider.hcl")
}

include "backend" {
    path = find_in_parent_folders("backend.hcl")
}

dependency "resource-group" {
    config_path = "../resource-group"
}

inputs = {
    resource_group_name = dependency.resource-group.outputs.resource-group-names["shak-rg.yaml"]
    storage_account_name = "shakdata"
    storage_account_containers = [
        {
            name = "inbound"
            access_type = "private"
        },
        {
            name = "outbound"
            access_type = "private"
        }
    ]

}