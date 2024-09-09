resource "azurerm_role_assignment" "rg_sp_owner" {
  scope                = data.azurerm_resource_group.default.id
  role_definition_name = "Owner"
  principal_id         = var.owner
  depends_on           = [data.azurerm_resource_group.default]
}

resource "azurerm_role_assignment" "amlw_owner" {
  scope                = azurerm_machine_learning_workspace.default.id
  role_definition_name = "Owner"
  principal_id         = var.owner
  depends_on           = [azurerm_machine_learning_workspace.default]
}

resource "azurerm_role_assignment" "amlw_data_scientist" {
  for_each             = toset(var.team_members)
  scope                = azurerm_machine_learning_workspace.default.id
  role_definition_name = "AzureML Data Scientist"
  principal_id         = each.value
  depends_on           = [azurerm_machine_learning_workspace.default]
}

resource "azurerm_role_assignment" "storage_account_contributor" {
  for_each             = toset(var.team_members)
  scope                = azurerm_storage_account.default.id
  role_definition_name = "Contributor"
  principal_id         = each.value
  depends_on           = [azurerm_storage_account.default]
}

resource "azurerm_role_assignment" "rg_cost_reader" {
  for_each             = toset(var.team_members)
  scope                = data.azurerm_resource_group.default.id
  role_definition_name = "Cost Management Reader"
  principal_id         = each.value
  depends_on           = [data.azurerm_resource_group.default]
}