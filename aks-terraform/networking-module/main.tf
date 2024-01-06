# main.tf

provider "azurerm" {
  features = {}
}

# Create Azure Resource Group
resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.location
}

# Create Virtual Network
resource "azurerm_virtual_network" "aks_vnet" {
  name                = "aks-vnet"
  resource_group_name = azurerm_resource_group.aks_rg.name
  location            = azurerm_resource_group.aks_rg.location
  address_space       = var.vnet_address_space
}

# Create Control Plane Subnet
resource "azurerm_subnet" "control_plane_subnet" {
  name                 = "control-plane-subnet"
  resource_group_name  = azurerm_resource_group.aks_rg.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes    = ["10.0.1.0/24"]
}

# Create Worker Node Subnet
resource "azurerm_subnet" "worker_node_subnet" {
  name                 = "worker-node-subnet"
  resource_group_name  = azurerm_resource_group.aks_rg.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes    = ["10.0.2.0/24"]
}

# Create Network Security Group (NSG)
resource "azurerm_network_security_group" "aks_nsg" {
  name                = "aks-nsg"
  resource_group_name = azurerm_resource_group.aks_rg.name
}

# Create Inbound Rule for kube-apiserver
resource "azurerm_network_security_rule" "kube_apiserver_rule" {
  name                        = "kube-apiserver-rule"
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_address_prefix       = "81.155.16.76"  # public IP address
  source_port_range           = "*"
  destination_address_prefix  = azurerm_subnet.control_plane_subnet.address_prefixes[0]
  destination_port_range      = "6443"
  resource_group_name         = azurerm_resource_group.aks_rg.name
  network_security_group_name = azurerm_network_security_group.aks_nsg.name
}

# Create Inbound Rule for SSH
resource "azurerm_network_security_rule" "ssh_rule" {
  name                        = "ssh-rule"
  priority                    = 1002
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_address_prefix       = "81.155.16.76"  # public IP address
  source_port_range           = "*"
  destination_address_prefix  = azurerm_subnet.control_plane_subnet.address_prefixes[0]
  destination_port_range      = "22"
  resource_group_name         = azurerm_resource_group.aks_rg.name
  network_security_group_name = azurerm_network_security_group.aks_nsg.name
}
