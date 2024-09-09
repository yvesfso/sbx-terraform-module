variable "resource_group_name" {
  type        = string
  description = "Name of the resource group in which the resources will be created"
}

variable "name" {
  type        = string
  description = "Name of the deployment"
  validation {
    condition     = length(var.name) >= 5 && length(var.name) <= 15 && lower(var.name) == var.name
    error_message = "The deployment name should only contain lowercase letters, numbers and must be between 5 and 15 characters long."
  }
}

variable "display_name" {
  type        = string
  description = "Friendly name of the deployment"
  default     = ""
}

variable "description" {
  type        = string
  description = "The description of the Machine Learning Workspace."
  default     = ""
}

variable "environment" {
  type        = string
  description = "Environment Name"
  default     = ""
}

variable "location" {
  type        = string
  description = "Location of the resources"
  default     = "Brazil South"
  validation {
    condition     = contains(["East US", "Brazil South"], var.location)
    error_message = "You can only specify one of the following locations: East US, Brazil South."
  }
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault."
  type        = string
  default     = ""
}

variable "kv_sku" {
  description = "The SKU of the Key Vault to be created."
  type        = string
  default     = "standard"
  validation {
    condition     = contains(["standard", "premium"], var.kv_sku)
    error_message = "You can only specify one of the following SKUs: standard, premium."
  }  
}