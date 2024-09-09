output "amlw_resources" {
  value = {
    resource_group = {
      name = data.azurerm_resource_group.default.name
    }

    key_vault = {
      name = azurerm_key_vault.default.name
    }

    application_insights = {
      name = azurerm_application_insights.default.name
    }

    storage_account = {
      name = azurerm_storage_account.default.name
    }

    container_registry = {
      name = azurerm_container_registry.default.name
    }

    machine_learning = {
      workspace_name = azurerm_machine_learning_workspace.default.name
      studio_url     = "https://ml.azure.com/?tid=${var.tenant_id}&wsid=${azurerm_machine_learning_workspace.default.id}"
      # studio_url        = "https://ml.azure.com/?tid=${data.azuread_client_config.current.tenant_id}&wsid=/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourcegroups/${data.azurerm_resource_group.default.name}/providers/Microsoft.MachineLearningServices/workspaces/${azurerm_machine_learning_workspace.default.name}"
      compute_instances = length(azurerm_machine_learning_compute_instance.default) > 0 ? azurerm_machine_learning_compute_instance.default[*].name : null
      cluster           = length(azurerm_machine_learning_compute_cluster.default) > 0 ? azurerm_machine_learning_compute_cluster.default[0].name : null #Getting the first item, because the cluster is optional and the "count" metadata was used to control the creation of the resource or not.
    }
  }
  description = "Output containing the provisioned resources"
}

# output "cognitive_services_endpoint" {
#   value       = var.use_cognitive_services ? "https://portal.azure.com/#@petrobrasbr.onmicrosoft.com/resource/subscriptions/${data.azuread_client_config.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.default.name}/providers/Microsoft.CognitiveServices/accounts/${module.cognitive_services[0].cognitive_services_name}/cskeys" : ""
#   description = "The endpoint used to connect to the Cognitive Service Account"
# }