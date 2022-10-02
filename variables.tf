variable "meta" {
  type    = any
  default = {}
}
variable "cloud" {
  type    = string
  default = "AzurePublicCloud"
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
