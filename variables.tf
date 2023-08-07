variable "name" {
  description = "(Required) The name of the storage account."
  type        = string
}

variable "location" {
  description = "(Required) The location of the storage account."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The resource group name of the storage account."
  type        = string
}

variable "role_assignments" {
  description = "(Optional) A list of rules for user assigned identity."
  type = list(object({
    name  = string
    scope = string
    role  = string
  }))
  default = []
}