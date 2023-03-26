locals {
  to_az_location = merge(
    # default: {country}{region}
    { for pair in setproduct(local.countries, local.cardinalities) : join("-", pair) => join("", pair) },
    {
      # Exceptions
      "global"         = "eastus"
      "us-east"        = "eastus"
      "us-west"        = "westus"
      "europe-north"   = "northeurope"
      "europe-west"    = "westeurope"
      "india-central"  = "centralindia"
      "asia-east"      = "eastasia"
      "asia-southeast" = "southeastasia"
    }
  )
  to_az_location_name = merge(
    # default: {Country}{Region}
    {
      for pair in setproduct(local.countries, local.cardinalities) : join("-", pair) =>
      join("", [title(pair[0]), title(pair[1])])
    },
    {
      # Exceptions
      "global"         = "Global"
      "asia-southeast" = "AsiaSouthEast"
      "uae-north"      = "UAE-North"
    }
  )
}
