# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }

provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "rg" {
  name     = "umr-resources"
  location = "West Europe"
}

resource "azurerm_attestation_provider" "rg1" {
  name                = "exampleproviderumr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}

resource "azurerm_storage_account" "rg3" {
  name                     = "storageaccountnameumr"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}