variable "aks_cluster_name" {
    description = "The AKS cluster name"
    type = string
}

variable "cluster_location" {
    description = "The location for the AKS Cluster"
    type = string
}

variable "dns_prefix" {
    description = "The DNS prefix"
    type = string
}

variable "kubernetes_version" {
    description = "The version of Kubernetes"
    type = string
}

variable "service_principal_client_id" {
    description = "The service principal Client ID"
    type = string
}

variable "service_principal_client_secret" {
    description = "The service principle Client secret"
    type = string
}

# Input variables from the networking module

variable "resource_group_name" {
  description = "The resource group name"
  type = string
}

variable "vnet_id" {
    description = "The Virtual Network ID"
    type = string
}

variable "control_plane_subnet_id" {
    description = "The control plane subnet ID"
    type = string
}

variable "worker_node_subnet_id" {
    description = "The worker node subnet ID"
    type = string
}

variable "aks_nsg_id" {
    description = "The Network Security Group ID"
    type = string
}

variable "my_ip" {
  type        = string
}

variable "my_client_id" {
  type        = string
}

variable "my_client_secret" {
  type        = string
}