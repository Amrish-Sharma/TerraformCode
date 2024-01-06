data "azurerm_key_vault_secret" "secret_saucepassword" {
  name         = "secret-sauce"
  key_vault_id = azurerm_key_vault.vault.id
  depends_on   = [azurerm_key_vault.vault]
}
