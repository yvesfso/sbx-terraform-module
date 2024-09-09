# sbx-terraform-module
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_resource_group.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | The description of the Machine Learning Workspace. | `string` | `""` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | Friendly name of the deployment | `string` | `""` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment Name | `string` | `""` | no |
| <a name="input_kv_sku"></a> [kv\_sku](#input\_kv\_sku) | The SKU of the Key Vault to be created. | `string` | `"premium"` | no |
| <a name="input_location"></a> [location](#input\_location) | Location of the resources | `string` | `"Brazil South"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the deployment | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group in which the resources will be created | `string` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_provisioned_resources"></a> [provisioned\_resources](#output\_provisioned\_resources) | n/a |
<!-- END_TF_DOCS -->