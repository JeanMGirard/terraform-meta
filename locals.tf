

locals {
  is_secondary      = can(coalesce(lookup(var.meta, "tenant_id", "")))
  cardinalities     = ["east", "west", "north", "south", "central"]
  countries         = ["us", "europe", "australia", "canada", "france", "korea", "india", "asia", "uae"]
  to_env_name = {
    shared      = "Shared"
    multi       = "Shared"
    prod        = "Production"
    production  = "Production"
    stg         = "Staging"
    staging     = "Staging"
    test        = "Test"
    dev         = "Development"
    development = "Development"
  }
  to_region_code = merge(
    # default: {Country(^3)}
    {for country in local.countries : country => try(substr(country, 0, 3), "")},
    {
      # Exceptions
      "global"    = "us"
      "asia"      = "as"
      "us"        = "us"
      "europe"    = "eu"
    }
  )




  defaults = {
    default_tags = {
      ManagedBy = "Terraform"
    }
    tags         = {}
  }
  base_meta = merge(
    {for k, v in var.meta : k => v if v != null && v != "" },
    {for k, v in {
      env           = var.env
      region        = var.region
      ns            = var.ns
      stack         = var.stack
      component     = var.component
      cloud         = var.cloud
      default_tags = merge(local.defaults.default_tags, var.default_tags == null ? {} : var.default_tags)
      tags         = merge(local.defaults.tags, var.tags == null ? {} : var.tags)
    } : k => ((v == null || v == "" || v == {}) ? try(lookup(var.meta, k, lookup(local.defaults, k, v)), v) : v) }
  )

  # Identifiers
  tenant_id       = lookup(local.base_meta, "tenant_id", one(data.azurerm_client_config.main.*.tenant_id))
  env             = lookup(local.base_meta, "env", var.env)
  environment     = lookup(local.to_env_name, local.env, null)
  region          = lookup(local.base_meta, "region", var.region)
  region_code     = lookup(local.to_region_code, split("-", lookup(local.base_meta, "region", var.region))[0], local.to_region_code["global"])
  location        = lookup(local.to_az_location,            lookup(local.base_meta, "region", var.region),    local.to_az_location["global"])
  location_name   = lookup(local.to_az_location_name,       lookup(local.base_meta, "region", var.region),     local.to_az_location_name["global"])
  ns              = lookup(local.base_meta, "ns", var.ns)
  stack           = replace(lookup(local.base_meta, "stack", var.stack), "_region", local.region)
  component       = replace(lookup(local.base_meta, "component", var.component), "_region", local.region)
  cloud           = lookup(local.base_meta, "cloud", var.cloud)

  default_tags    = { for k, v in merge({
    Environment = local.environment
    Stack       = local.stack
    Namespace   = local.ns
    Component   = local.component
  }, lookup(local.base_meta, "default_tags", {})) : k => v if v != null && v != "" }
  tags    = { for k, v in merge(local.default_tags, {}, lookup(local.base_meta, "tags", {})) : k => v if v != null && v != "" }




}
