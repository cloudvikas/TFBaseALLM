# Resource-2: virtual network
resource "azurerm_virtual_network" "vnet" {
  #name = "var.vnet_name&${random_string.myrandom.id}"
  # Vnet name can not have &,$,%
  name = var.vnet_name
  address_space = ["10.0.0.0/16"]
  location = var.location
  resource_group_name = azurerm_resource_group.myrg.name
 
}

resource "azurerm_subnet" "subnet" {
  name = var.subnet_name #${random_string.myrandom.id}"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name = azurerm_resource_group.myrg.name
  address_prefixes = ["10.0.1.0/24"]
    
}

resource "azurerm_public_ip" "public_ip" {
  name = var.public_ip#${random_string.myrandom.id}"
  resource_group_name = azurerm_resource_group.myrg.name
  location = azurerm_resource_group.myrg.location
  allocation_method = "Static"
  
}

resource "azurerm_network_interface" "myvmnic" {
  name                = var.vnet_nic#${random_string.myrandom.id}"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
}

