locals {
  location_code = lower(replace(var.location, " ", ""))
}

data "azurerm_resource_group" "default" {
  name = var.resource_group_name
}

resource "azurerm_key_vault" "default" {
  name                     = "kv-${var.environment}-${var.name}"
  location                 = data.azurerm_resource_group.default.location
  resource_group_name      = data.azurerm_resource_group.default.name
  tenant_id                = var.tenant_id
  sku_name                 = "standard" # "premium"
  purge_protection_enabled = false
  depends_on               = [data.azurerm_resource_group.default]
}

resource "azurerm_application_insights" "default" {
  name                = "appi-${var.environment}-${var.name}"
  location            = data.azurerm_resource_group.default.location
  resource_group_name = data.azurerm_resource_group.default.name
  application_type    = "web"
  depends_on          = [data.azurerm_resource_group.default]
}

resource "azurerm_storage_account" "default" {
  name                            = "st${var.environment}ptb${var.name}"
  location                        = data.azurerm_resource_group.default.location
  resource_group_name             = data.azurerm_resource_group.default.name
  allow_nested_items_to_be_public = false
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  depends_on                      = [data.azurerm_resource_group.default]
}

resource "azurerm_container_registry" "default" {
  name                = "cr${var.environment}${var.name}"
  location            = data.azurerm_resource_group.default.location
  resource_group_name = data.azurerm_resource_group.default.name
  sku                 = "Premium"
  admin_enabled       = true
  depends_on          = [data.azurerm_resource_group.default]
}

# Machine Learning workspace
resource "azurerm_machine_learning_workspace" "default" {
  name                          = "mlw-${var.environment}-${var.name}"
  friendly_name                 = "${var.display_name} - ${var.scenario} - ${var.capacity}"
  description                   = var.description
  location                      = data.azurerm_resource_group.default.location
  resource_group_name           = data.azurerm_resource_group.default.name
  application_insights_id       = azurerm_application_insights.default.id
  key_vault_id                  = azurerm_key_vault.default.id
  storage_account_id            = azurerm_storage_account.default.id
  container_registry_id         = azurerm_container_registry.default.id
  public_network_access_enabled = true

  identity {
    type = "SystemAssigned"
  }

  tags = {
    "Cost Center" = "${var.cost_center}"
    "Name"        = "${var.display_name}"
    "Scenario"    = "${var.scenario}"
    "Capacity"    = "${var.capacity}"
  }

  depends_on = [
    data.azurerm_resource_group.default,
    azurerm_application_insights.default,
    azurerm_key_vault.default,
    azurerm_storage_account.default,
    azurerm_container_registry.default
  ]
}