# Terraform Block
terraform {
  # Terraform setting blocks TF CLI verion required (installed at your machine)
  # Example -  
  #required_version = "= 0.14.4"  - Will fail as it will not match with my desktopn installed version of TF
  # required_version = ">= 0.13"   - will pass as its >=
  # required_version = "~= 0.14.0"   - will fail as ~ means It will look for 0.14 only with any minor/sub-version
  # like 0.14.X and will not mach with > 0.14.X

  required_version = ">= 1.0.0"

  # Provider Block
  # To intract with respective Cloud providers like Azure/AWS/GCP
  # We can use Azure CLI/ (SPN or MI) to create resources in Azure. 
  # Create SPN and grant contributor Access it on Subscription and mentioned all the details in provider block.
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"   # primary location to download TF provider  --> registry.terraform.io/hashicorp/azurerm
      # for Azure -> https://registry.terraform.io/providers/hashicorp/azurerm/latest
      # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
      version = "~> 4.13.0"   # For Production grade, ~ will update the minor/sub-versions
      #version = "~> 2.0"             
      #version = ">= 2.0.0, < 2.60.0"
      #version = ">= 2.0.0, <= 2.64.0"   
      #version = "~> 2.64" # For Production grade              
    }
      random = {
      source = "hashicorp/random"
      version = ">= 3.0.0"
    }
  }
}

 # Provider specific configuration
 # Following block shows we are using Azure CLI to authenticate to Azure
 # If we want to use SPN or MI than we have to input SPN/MI details under "provider block"
provider "azurerm" {
  subscription_id = "3e8d0b99-bd61-4ce4-8a09-872780c18ca3"
features {}
 # features will be used for some (global setting) spacial resources like a Key-vault or Log analytics work space configuration
 # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/features-block 
}

#********* multiple provider is used to configure like - 
# Use-Case --> support multple regions in cloud platform like delete VM data disk with VM in eastus. but dont delete data disk with VM in westus 

# Provider-2 for WestUS
provider "azurerm" {
  features {
    virtual_machine {
      delete_os_disk_on_deletion = false # This will ensure when the Virtual Machine is destroyed, Disk is not deleted, default is true and we can alter it at provider level
    }
    
  }
  alias = "provider2-westus"
  # We can add other configuration as well given below
  #client_id = "XXXX"
  #client_secret = "YYY"
  #environment = "german"
  #subscription_id = "JJJJ"

}

# Provider Documentation for Reference
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs