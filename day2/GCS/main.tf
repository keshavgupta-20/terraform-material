resource "google_storage_bucket" "static-website" {
  name                        = "first-terraform-bucket-496012-sa"
  location                    = "US"
  uniform_bucket_level_access = true
  storage_class               = "NEARLINE"
  public_access_prevention    = "inherited"
  force_destroy               = true
  labels = {
    "env" = "value"
  }
  versioning {
    enabled = true
  }
   retention_policy {
    is_locked = true
    retention_period = 3000
  }
  lifecycle_rule {

    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }
  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type          = "SetStorageClass"
      storage_class = "COLDLINE"
    }
  }
}


# Grant public read access to all objects (allUsers via HTML or API)
resource "google_storage_bucket_iam_member" "public_read" {
  bucket = google_storage_bucket.static-website.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}
resource "google_storage_bucket_object" "picture" {
  name   = "butterfly01"
  source = "draw.png"
  bucket = google_storage_bucket.static-website.name
}


