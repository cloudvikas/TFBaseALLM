# Variables  Block
variable "name" {
  type = string
  default = "new-rg"
  description = "RG name"
  }

  variable "location" {
    type = string
    default = "eastus2"
    description = "Azure Region"
  }

  variable "vnet_name" {
    type = string
    default = "vnet"
    description = "Azure virtual network"
    
  }
  variable "subnet_name" {
    type = string
    default = "subnet1"
    description = "first subnet"
    
  }
variable "public_ip" {
  type = string
  default = "pubip1"
  description = "public IP"
  
}


variable "vnet_nic" {
  type = string
  default = "nic1"
  description = "nic"
  
}