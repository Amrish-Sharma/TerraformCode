terraform {
  backend "azurerm" {
    resource_group_name  = "<Give the name of resource group name>"
    storage_account_name = "<Give the name of Storage Account Name>"
    container_name       = "Give the name of container name"
    key                  = "give the name of tfstate filename"
  }
}
