
data "azurerm_client_config" "main" {
  count     = local.is_secondary ? 0 : 1
}
