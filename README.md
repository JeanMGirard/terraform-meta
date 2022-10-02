# Terraform modules - Meta

Inspired by https://github.com/cloudposse/terraform-null-label

Terraform module designed to generate consistent names and tags for resources.

```terraform
variable "meta" {
  type = any
  default = {
    # Identifiers
    tenant              = null
    stack               = null
    namespace           = null
    project             = null
    module              = null
    # Deployment
    env         = null
    region              = null
    stage               = null
    # Description
    name                = null
    description         = null
    # Configs
    enabled             = null
    iam_path            = null
    attributes          = {}
    default_tags        = {}
    tags                = {}
    flags               = []
  }
}

module "meta" {
  source  = "git@github.com:JeanMGirard/terraform-modules.git//helpers/meta"
  meta = var.meta

  tenant              = var.tenant
  stack               = var.stack
  namespace           = var.namespace
  project             = var.project
  module              = var.module
  # Deployment
  env         = var.env
  region              = var.region
  stage               = var.stage
  # Description
  name                = var.name
  description         = var.description
  # Configs
  enabled             = var.enabled
  iam_path            = var.iam_path
  attributes          = var.attributes
  default_tags        = var.default_tags
  tags                = var.tags
  flags               = var.flags
}
locals {
  meta = { for k, v in module.meta : k => v if can(coalesce(v))  }
}
output "meta" {
  value       = local.meta
  description = "Metadata"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_component"></a> [component](#input\_component) | n/a | `string` | `""` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | n/a | `map(string)` | `null` | no |
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | `""` | no |
| <a name="input_meta"></a> [meta](#input\_meta) | n/a | `any` | `{}` | no |
| <a name="input_ns"></a> [ns](#input\_ns) | n/a | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `""` | no |
| <a name="input_stack"></a> [stack](#input\_stack) | n/a | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_component"></a> [component](#output\_component) | n/a |
| <a name="output_default_tags"></a> [default\_tags](#output\_default\_tags) | n/a |
| <a name="output_env"></a> [env](#output\_env) | Identifiers |
| <a name="output_location"></a> [location](#output\_location) | n/a |
| <a name="output_location_global"></a> [location\_global](#output\_location\_global) | n/a |
| <a name="output_location_name"></a> [location\_name](#output\_location\_name) | n/a |
| <a name="output_ns"></a> [ns](#output\_ns) | n/a |
| <a name="output_region"></a> [region](#output\_region) | n/a |
| <a name="output_region_code"></a> [region\_code](#output\_region\_code) | n/a |
| <a name="output_stack"></a> [stack](#output\_stack) | n/a |
| <a name="output_tags"></a> [tags](#output\_tags) | n/a |
<!-- END_TF_DOCS -->