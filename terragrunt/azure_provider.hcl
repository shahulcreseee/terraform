generate "azure_provider" {
    path = "azure_provider.tf"
    if_exists = "overwrite_terragrunt"
    contents = <<EOF
    terraform {
        required_providers {
            azurerm = {
                source = "hashicorp/azurerm"
                version = "3.93.0"
            }
        }
    }
    provider "azurerm" {
        features {}
        subscription_id = "Fill in with you azure subscription"
    }    
    EOF
}