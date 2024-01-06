data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}


# Create the keyvault with name examplekeyvault

resource "azurerm_key_vault" "vault" {
  name                       = "examplekeyvault"
  location                   = azurerm_resource_group.example.location
  resource_group_name        = azurerm_resource_group.example.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "premium"
  soft_delete_retention_days = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover"
    ]
  }
}


#create a random password of length 16 with no special characters
resource "random_password" "password" {
  length      = 16
  special     = false
  min_upper   = 4
  min_lower   = 4
  min_numeric = 4
}


resource "azurerm_key_vault_secret" "secret" {
  name         = "secret-sauce"
  value        = random_password.password.result
  key_vault_id = azurerm_key_vault.vault.id
}
