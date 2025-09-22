variable "location" {
  description = "Azure region"
  type        = string
  default     = "australiaeast"
}

variable "staging_rg_name" {
  description = "Resource Group for staging environment"
  type        = string
  default     = "ecom-staging-rg"
}

variable "staging_aks_name" {
  description = "Staging AKS cluster name"
  type        = string
  default     = "ecom-staging-aks"
}

variable "dns_prefix" {
  description = "DNS prefix for AKS cluster"
  type        = string
  default     = "ecom-staging"
}

variable "kubernetes_version" {
  description = "AKS version"
}

variable "node_count" {
  description = "Default node pool size"
  type        = number
  default     = 1
}

variable "node_vm_size" {
  description = "VM size for node pool"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "acr_name" {
  description = "Azure Container Registry name"
  type        = string
}
