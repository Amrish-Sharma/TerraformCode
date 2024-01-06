output "secret_saucepassword" {
  value = azurerm_key_vault_secret.secret.value
}
