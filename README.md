<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | (Required) The location of the storage account. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the storage account. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The resource group name of the storage account. | `string` | n/a | yes |
| <a name="input_role_assignments"></a> [role\_assignments](#input\_role\_assignments) | (Optional) A list of rules for user assigned identity. | <pre>list(object({<br>    name  = string<br>    scope = string<br>    role  = string<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The id of user assigned identity. |
| <a name="output_name"></a> [name](#output\_name) | The name of the user assigned identity. |
| <a name="output_object"></a> [object](#output\_object) | The user assigned identity object. |

## Resources

| Name | Type |
|------|------|
| [azurerm_role_assignment.roles](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_user_assigned_identity.identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |

## Modules

No modules.

## Example Code

```hcl
module "user_assigned_identity" {
  source = "github.com/danielkhen/user_assigned_identity_module"

  name                = "test-identity"
  location            = "westeurope"
  resource_group_name = azurerm_resource_group.example.name

  role_assignments = [
    {
      name  = "example"
      scope = data.azurerm_log_analytics_workspace.example.id
      role  = "Reader"
    }
  ]
}
```
<!-- END_TF_DOCS -->