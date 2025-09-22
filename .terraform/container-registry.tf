#
# Creates a container registry on Azure
#
resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.staging.name
  location            = azurerm_resource_group.staging.location
  sku                 = "Basic"
  admin_enabled       = true
}
output "registry_hostname" {
  value = azurerm_container_registry.acr.login_server
}

output "registry_un" {
  value = azurerm_container_registry.acr.admin_username
}

output "registry_pw" {
  value     = azurerm_container_registry.acr.admin_password
  sensitive = true
}
