output "provisioned_resources" {
  value = {
    resource_group = {
      name = azurerm_resource_group.default.name
    }

    key_vault = {
      name = azurerm_key_vault.default.name
    }
  description = "Output containing the provisioned resources"
  }
}