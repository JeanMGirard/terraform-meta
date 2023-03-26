variable "meta" {
  type    = any
  default = {}
}
variable "env" {
  type    = string
  default = ""
}
variable "region" {
  type    = string
  default = ""
}
variable "ns" {
  type    = string
  default = ""
}
variable "stack" {
  type    = string
  default = ""
}
variable "component" {
  type    = string
  default = ""
}
variable "default_tags" {
  type    = map(string)
  default = null
}
variable "tags" {
  type    = map(string)
  default = null
}
variable "azure_cloud" {
  type    = string
  default = "AzurePublicCloud"
}
variable "prefix" {
  type    = string
  default = ""
}
variable "suffix" {
  type    = string
  default = ""
}
variable "merge_tags" {
  type    = bool
  default = false
}
