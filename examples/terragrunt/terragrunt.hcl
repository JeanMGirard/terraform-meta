skip = true

generate "meta" {
  path      = "meta.tf"
  if_exists = "overwrite_terragrunt"
  contents  = templatefile("${path.root}/meta.tftpl", {
    module_path = "PATH_TO_META_MODULE"
  })
}
