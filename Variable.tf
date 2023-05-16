variable "rgname" {
    type = string
    description = "this is the resource group name"
    default = "ankushrg"
}

variable "location" {
    type = string
    description = "this is the resource group location"
    default = "East US"
}

variable "vnetname" {
    type = string
    description = "this is the vnet name"
    default = "vnet1"
}

variable "vnetip" {
    type = list(any)
    description = "this is the vnet ip address"
    default = ["10.0.0.0/16"]
}

variable "subname" {
    type = list(any)
    description = "this is the subnet name"
    default = ["subnet1","subnet2","subnet3"]
}

variable "subnet_prefix" {
    type = list(any)
    description = "this is the subnet name"
    default = ["10.0.1.0/24","10.0.2.0/24","10.0.0.0/24"]
}


