variable "resource_group_name" {
    description = "storage account resource group"
    type = string
}

variable "storage_account_name" {
  description = "the name of the Storage Account"
  type = string
}

variable "storage_account_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium"
  type = string
  default = "Standard"
}

variable "storage_account_replication_type" {
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS."
  type = string
  default = "LRS"
}

variable storage_account_containers {
    type = list(object({
      name = string
      access_type = optional(string, "private")
    }))
    description = "storage account container list"
}