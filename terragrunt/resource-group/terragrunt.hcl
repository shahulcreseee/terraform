terraform {
    source = "../../terraform/resource-group"
}

include "azure_provider" {
    path = find_in_parent_folders("azure_provider.hcl")
}

include "backend" {
    path = find_in_parent_folders("backend.hcl")
}

inputs = {
    resource_group_directory = "./details"
}