# Output Variables  Block
output "azurerm_resource_groupame" {
    value = azurerm_resource_group.myrg.name
  
}
output "azurerm_resource_group" {
  value = azurerm_resource_group.myrg.location
}

output "azurerm_storage_account" {
  value = azurerm_storage_account.mysa.name
   
}
output "azurerm_virtual_network_name" {
  description = "Virtual Network Name"
  value = azurerm_virtual_network.vnet.name
  
}

output "azurerm_virtual_network_id" {
  description = "Virtual Network Name ID"
  value = azurerm_virtual_network.vnet.id
 
  
}
output "azurerm_subnet" {
  value = azurerm_subnet.subnet.name
  
}
output "azurerm_public_ip" {
  value = azurerm_public_ip.public_ip.ip_address
  
}