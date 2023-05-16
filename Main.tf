resource "azurerm_resource_group" "rg" {
  name     = "${var.rgname}"
  location = "${var.location}"
}


resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnetname}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = "${var.vnetip}"
}

resource "azurerm_subnet" "subnet" {
   count = 3 
   name                = "${var.subname}-${count.index + 1}"
  address_prefixes     = "[10.0.$[count.index + 1].0/24]"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
}

terraform {
  backend "azurerm" {
    resource_group_name  = "Storagerg"
    storage_account_name = "storageaccount5591"
    container_name       = "tfstate"
    key                  = "vnet.terraform.tfstate"
    access_key = "9DcT8nW/iKr0v2t8bfFIfM24sfJRGva1oD4macMbw6UkSwUXYHJr0ErQzgv15oErzQebT6lpi4zl+ASt2Lfeeg=="
  }
}