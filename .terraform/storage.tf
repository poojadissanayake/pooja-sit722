#
# Storage Account + Blob container the Product Service will use
#
resource "azurerm_storage_account" "staging" {
  name                     = "${var.staging_aks_name}stgsa"
  resource_group_name      = azurerm_resource_group.staging.name
  location                 = azurerm_resource_group.staging.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Container name must match app expectation: "product-images"
resource "azurerm_storage_container" "product_images" {
  name                  = "product-images"
  storage_account_name  = azurerm_storage_account.staging.name
  container_access_type = "private"
}

#
# Outputs for wiring into K8s secret (product service will read these env vars)
#
output "storage_account_name" {
  value       = azurerm_storage_account.staging.name
  description = "Storage Account for staging environment"
}

output "storage_account_key" {
  value       = azurerm_storage_account.staging.primary_access_key
  description = "Primary access key for the Storage Account"
  sensitive   = true
}

output "product_images_container" {
  value       = azurerm_storage_container.product_images.name
  description = "Blob container for product images (expected by app)"
}