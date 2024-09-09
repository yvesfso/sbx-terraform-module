# Machine Learning workspace - compute instance
resource "azurerm_machine_learning_compute_instance" "default" {
  count                         = var.compute_instance_settings != null ? length(var.team_members) : 0
  name                          = "mlci${var.name}${format("%03s", count.index + 1)}"
  # location                      = data.azurerm_resource_group.default.location
  machine_learning_workspace_id = azurerm_machine_learning_workspace.default.id
  virtual_machine_size          = var.compute_instance_settings.vm_size
  authorization_type            = "personal"

  assign_to_user {
    object_id = var.team_members[count.index]
    tenant_id = var.tenant_id
  }

  depends_on = [azurerm_machine_learning_workspace.default]
}

# Machine Learning workspace - compute cluster
resource "azurerm_machine_learning_compute_cluster" "default" {
  count                         = var.compute_cluster_settings != null ? 1 : 0
  name                          = "mlcc${var.name}${format("%03s", count.index + 1)}"
  location                      = data.azurerm_resource_group.default.location
  vm_priority                   = var.compute_cluster_vm_priority
  vm_size                       = var.compute_cluster_settings.vm_size
  machine_learning_workspace_id = azurerm_machine_learning_workspace.default.id

  scale_settings {
    min_node_count                       = var.compute_cluster_settings.scale_settings.min_node_count
    max_node_count                       = var.compute_cluster_settings.scale_settings.max_node_count
    scale_down_nodes_after_idle_duration = var.compute_cluster_settings.scale_settings.scale_down_nodes_after_idle_duration
  }

  lifecycle {
    ignore_changes = all
  }

  depends_on = [azurerm_machine_learning_workspace.default]
}