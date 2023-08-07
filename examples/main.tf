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