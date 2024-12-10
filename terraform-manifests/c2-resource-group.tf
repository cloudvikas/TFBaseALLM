# Resource Block
# Create a resource group
resource "azurerm_resource_group" "myrg" {
  name = var.name
  location = var.location
}