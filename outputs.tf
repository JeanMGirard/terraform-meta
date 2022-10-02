# # This is where you put your outputs declaration

# Identifiers
output "tenant_id" { value = local.tenant_id }
output "env" { value = local.env }
output "environment" { value = local.environment }
output "region" { value = local.region }
output "region_code" { value = local.region_code }
output "location" { value = local.location }
output "location_global" { value = "eastus" }
output "location_name" { value = local.location_name }
output "ns" { value = local.ns }
output "stack" { value = local.stack }
output "component" { value = local.component }
output "default_tags" { value = local.default_tags }
output "tags" { value = local.tags }
output "cloud" { value = local.cloud }


