locals {
  location_code = lower(replace(var.location, " ", ""))
}

resource "azurerm_resource_group" "default" {
  name    = var.resource_group_name
  location = var.location
}

resource "azurerm_key_vault" "default" {
  name                     = "kv-${var.environment}-${var.name}"
  location                 = azurerm_resource_group.default.location
  resource_group_name      = azurerm_resource_group.default.name
  tenant_id                = var.tenant_id
  sku_name                 = var.kv_sku
  purge_protection_enabled = false
  depends_on               = [azurerm_resource_group.default]
}
