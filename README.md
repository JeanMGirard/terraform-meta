# Meta module

Inspired by https://github.com/cloudposse/terraform-null-label

Terraform module designed to generate consistent names and tags for resources.

<!-- TOC -->
* [Meta module](#meta-module)
  * [Usage](#usage)
  * [Inputs](#inputs)
  * [Outputs](#outputs)
  * [Examples](#examples)
<!-- TOC -->


## Usage

```terraform
# ==== Root module =============

module "meta" {
  source = "Meta"
  
  env = "dev"
  region = "us-east-1"
  # ... other metadata
}

module "example_module_1" {
  source = "Meta"
  meta = module.meta
}
```

```terraform
# ==== example_module_1 =============

variable "meta" {
  type = any
  default = null
}

module "meta" {
  source = "Meta"
  meta = var.meta
  
  # Can override the parent metadata
  region = "us-east-2"
}

locals {
  env = module.meta.env
  region = module.meta.region
}

```

---------------------------------------------------------------------------------------

<!-- BEGIN_TF_DOCS -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_cloud"></a> [azure\_cloud](#input\_azure\_cloud) | Azure Cloud. | `string` | `"AzurePublicCloud"` | no |
| <a name="input_component"></a> [component](#input\_component) | Smallest infrastructure or application block. It defaults to the last dotted section stack name (eg: 'admin.k8s.cluster' becomes 'cluster'). | `string` | `""` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Default tags to be applied to all resources. | `map(string)` | `null` | no |
| <a name="input_env"></a> [env](#input\_env) | Environment key (short). | `string` | `""` | no |
| <a name="input_merge_tags"></a> [merge\_tags](#input\_merge\_tags) | Merge the tags inside the default tags and vice-versa (will force sub-meta modules to inherit those tags). | `bool` | `false` | no |
| <a name="input_meta"></a> [meta](#input\_meta) | Pass it another Meta module to inherit from it. | `any` | `{}` | no |
| <a name="input_ns"></a> [ns](#input\_ns) | Namespace: Root division, it contains all other separation. | `string` | `""` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Common prefix for resources in depending modules. | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS-like region. You can omit the -1 in the names (eg: us-east instead of us-east-1). | `string` | `""` | no |
| <a name="input_stack"></a> [stack](#input\_stack) | Parent infrastructure or application block. | `string` | `""` | no |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | Common suffix for resources in depending modules. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags applied to all resources in directly depending modules (not inherited). | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_all_tags"></a> [all\_tags](#output\_all\_tags) | n/a |
| <a name="output_aws_region"></a> [aws\_region](#output\_aws\_region) | n/a |
| <a name="output_azure_cloud"></a> [azure\_cloud](#output\_azure\_cloud) | n/a |
| <a name="output_component"></a> [component](#output\_component) | n/a |
| <a name="output_default_tags"></a> [default\_tags](#output\_default\_tags) | n/a |
| <a name="output_env"></a> [env](#output\_env) | n/a |
| <a name="output_environment"></a> [environment](#output\_environment) | n/a |
| <a name="output_location"></a> [location](#output\_location) | n/a |
| <a name="output_location_global"></a> [location\_global](#output\_location\_global) | n/a |
| <a name="output_location_name"></a> [location\_name](#output\_location\_name) | n/a |
| <a name="output_merge_tags"></a> [merge\_tags](#output\_merge\_tags) | n/a |
| <a name="output_ns"></a> [ns](#output\_ns) | n/a |
| <a name="output_region"></a> [region](#output\_region) | n/a |
| <a name="output_region_code"></a> [region\_code](#output\_region\_code) | n/a |
| <a name="output_stack"></a> [stack](#output\_stack) | n/a |
| <a name="output_tags"></a> [tags](#output\_tags) | n/a |
| <a name="output_tenant_id"></a> [tenant\_id](#output\_tenant\_id) | Identifiers |
<!-- END_TF_DOCS -->

---------------------------------------------------------------------------------------



## Examples

* [simple](./examples/simple/README.md)
* [terragrunt](./examples/terragrunt/README.md)
* [chained](./examples/chained/README.md)

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
