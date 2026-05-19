resource "google_storage_bucket" "static-site" {
    name = "bucket-1"
    location = "us-central"
    force_destroy = true
    uniform_bucket_level_access = true
}
resource "google_storage_bucket_object" "archive" {

  name   = "function.zip"

  bucket = google_storage_bucket.bucket.name

  source = "./function/function.zip"
}
resource "google_cloudfunctions2_function" "deployment_notifier" {

  name     = "deployment-notifier"

  location = "us-central1"

  build_config {

    runtime     = "python311"

    entry_point = "hello"

    source {

      storage_source {

        bucket = google_storage_bucket.bucket.name

        object = google_storage_bucket_object.archive.name
      }
    }
  }

  service_config {

    max_instance_count = 1

    available_memory = "256M"

    ingress_settings = "ALLOW_ALL"
  }
}
resource "google_compute_instance" "vm" {

  name = "terraform-vm"

  machine_type = "e2-micro"

  zone = "us-central1-a"

  boot_disk {

    initialize_params {

      image = "debian-cloud/debian-12"
    }
  }

  network_interface {

    network = "default"

    access_config {}
  }
}
action "google_cloudfunctions_invoke" "notify" {

  config {

    function_name = google_cloudfunctions2_function.deployment_notifier.name

    payload = jsonencode({

      vm     = google_compute_instance.vm.name

      status = "created"

    })
  }
}