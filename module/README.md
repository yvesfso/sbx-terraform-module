# sbx-terraform-module
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_application_insights.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights) | resource |
| [azurerm_consumption_budget_resource_group.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/consumption_budget_resource_group) | resource |
| [azurerm_container_registry.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |
| [azurerm_key_vault.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_machine_learning_compute_cluster.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/machine_learning_compute_cluster) | resource |
| [azurerm_machine_learning_compute_instance.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/machine_learning_compute_instance) | resource |
| [azurerm_machine_learning_workspace.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/machine_learning_workspace) | resource |
| [azurerm_role_assignment.amlw_data_scientist](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.amlw_owner](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.rg_cost_reader](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.rg_sp_owner](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.storage_account_contributor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_storage_account.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [random_string.random](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [azurerm_resource_group.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_budget"></a> [budget](#input\_budget) | Expected monthly budget for the AMLW and Cognitive Services (if enabled). This value is used as the basis for budget alerts. | `number` | `1` | no |
| <a name="input_capacity"></a> [capacity](#input\_capacity) | AMLW compute capacity (e.g.: tipico, deeplearningbr, deeplearningus, etc) | `string` | `""` | no |
| <a name="input_compute_cluster_settings"></a> [compute\_cluster\_settings](#input\_compute\_cluster\_settings) | Manages a Machine Learning Compute Cluster | <pre>object({<br>    vm_size = string<br>    scale_settings = object({<br>      min_node_count                       = number<br>      max_node_count                       = number<br>      scale_down_nodes_after_idle_duration = string<br>    })<br>  })</pre> | `null` | no |
| <a name="input_compute_cluster_vm_priority"></a> [compute\_cluster\_vm\_priority](#input\_compute\_cluster\_vm\_priority) | The priority of the VM | `string` | `"LowPriority"` | no |
| <a name="input_compute_instance_settings"></a> [compute\_instance\_settings](#input\_compute\_instance\_settings) | Manages a Machine Learning Compute Instance | <pre>object({<br>    vm_size = string<br>  })</pre> | `null` | no |
| <a name="input_cost_center"></a> [cost\_center](#input\_cost\_center) | Cost center | `string` | `""` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the Machine Learning Workspace. | `string` | `""` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | Friendly name of the deployment | `string` | `""` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment Name | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | Location of the resources | `string` | `"Brazil South"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the deployment | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | Deployment owner | `string` | `""` | no |
| <a name="input_owner_email"></a> [owner\_email](#input\_owner\_email) | Owner contact email | `string` | `""` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group in which the resources will be created | `string` | n/a | yes |
| <a name="input_scenario"></a> [scenario](#input\_scenario) | AMLW scenario (e.g.:sandbox, curso, experimentacao, etc) | `string` | `""` | no |
| <a name="input_team_members"></a> [team\_members](#input\_team\_members) | Workspace Team Members. This parameter must receive emails separated by semicolon(;) | `list(string)` | `[]` | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. | `string` | `""` | no |
| <a name="input_use_cognitive_services"></a> [use\_cognitive\_services](#input\_use\_cognitive\_services) | If true, also deploy cognitive services. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_amlw_resources"></a> [amlw\_resources](#output\_amlw\_resources) | Output containing the provisioned resources |
<!-- END_TF_DOCS -->