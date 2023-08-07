resource "azurerm_user_assigned_identity" "identity" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  lifecycle {
    ignore_changes = [tags["CreationDateTime"], tags["Environment"]]
  }
}

locals {
  roles_map = {for role in var.role_assignments : role.name => role}
}

resource "azurerm_role_assignment" "roles" {
  for_each = local.roles_map

  role_definition_name = each.value.role
  principal_id         = azurerm_user_assigned_identity.identity.principal_id
  scope                = each.value.scope
}