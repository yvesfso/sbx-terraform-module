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

variable "scenario" {
  type        = string
  description = "AMLW scenario (e.g.:sandbox, curso, experimentacao, etc)"
  default     = ""
}

variable "capacity" {
  type        = string
  description = "AMLW compute capacity (e.g.: tipico, deeplearningbr, deeplearningus, etc)"
  default     = ""
}

variable "cost_center" {
  type        = string
  description = "Cost center"
  default     = ""
}

variable "owner" {
  type        = string
  description = "Deployment owner"
  default     = ""
}

variable "owner_email" {
  type        = string
  description = "Owner contact email"
  default     = ""
}

variable "team_members" {
  type        = list(string)
  description = "Workspace Team Members. This parameter must receive emails separated by semicolon(;)"
  default     = []
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

variable "compute_instance_settings" {
  type = object({
    vm_size = string
  })

  description = "Manages a Machine Learning Compute Instance"
  default     = null
}

variable "compute_cluster_settings" {
  type = object({
    vm_size = string
    scale_settings = object({
      min_node_count                       = number
      max_node_count                       = number
      scale_down_nodes_after_idle_duration = string
    })
  })

  description = "Manages a Machine Learning Compute Cluster"
  default     = null
}

variable "compute_cluster_vm_priority" {
  type        = string
  default     = "LowPriority" #"Dedicated"
  description = "The priority of the VM"
  validation {
    condition     = contains(["LowPriority", "Dedicated"], var.compute_cluster_vm_priority)
    error_message = "You can only specify one of the following VM priorities: LowPriority, Dedicated."
  }
}

variable "budget" {
  type        = number
  description = "Expected monthly budget for the AMLW and Cognitive Services (if enabled). This value is used as the basis for budget alerts."
  default     = 1
  validation {
    condition     = var.budget > 0
    error_message = "The budget amount must be greater than 0."
  }
}

variable "use_cognitive_services" {
  description = "If true, also deploy cognitive services."
  type        = bool
  default     = false
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault."
  type        = string
  default     = ""
}