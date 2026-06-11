resource "google_storage_bucket" "buckets" {
  for_each = local.bucket_names

  name     = each.value
  location = "US"

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  labels = merge(
    local.common_labels,
    local.env_labels[each.key]
  )
}
locals {
  bucket_names = {
    for env in var.env :
    env => lower(join("-", [env, var.app-name, var.project_id]))
  }

  env_labels = {
    for env in var.env :
    env => {
      environment = env
    }
  }

  common_labels = {
    managed_by = "terraform"
    project    = var.project_id
    app        = var.app-name
  }
}