# variables.tf

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "aks-terraform-project"  
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "UK South"  
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network (VNet)"
  type        = list(string)
  default     = ["10.0.0.0/16"]  
}
