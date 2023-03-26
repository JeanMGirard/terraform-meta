variable "meta" {
  type        = any
  description = "Pass it another Meta module to inherit from it."
  default     = {}
}
variable "ns" {
  type        = string
  description = "Namespace: Root division, it contains all other separation."
  default     = ""
}
variable "env" {
  type        = string
  description = "Environment key (short)."
  default     = ""
}
variable "region" {
  type        = string
  description = "AWS-like region. You can omit the -1 in the names (eg: us-east instead of us-east-1)."
  default     = ""
}

variable "stack" {
  type        = string
  description = "Parent infrastructure or application block."
  default     = ""
}
variable "component" {
  type        = string
  description = "Smallest infrastructure or application block. It defaults to the last dotted section stack name (eg: 'admin.k8s.cluster' becomes 'cluster')."
  default     = ""
}
variable "default_tags" {
  type        = map(string)
  description = "Default tags to be applied to all resources."
  default     = null
}
variable "tags" {
  type        = map(string)
  description = "Tags applied to all resources in directly depending modules (not inherited)."
  default     = null
}
variable "azure_cloud" {
  type        = string
  description = "Azure Cloud."
  default     = "AzurePublicCloud"
}
variable "prefix" {
  type        = string
  description = "Common prefix for resources in depending modules."
  default     = ""
}
variable "suffix" {
  type        = string
  description = "Common suffix for resources in depending modules."
  default     = ""
}
variable "merge_tags" {
  type        = bool
  description = "Merge the tags inside the default tags and vice-versa (will force sub-meta modules to inherit those tags)."
  default     = false
}
