terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.31.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "learn-terraform-496012"
  region  = "us-central1"
  zone    = "us-central1-a"  
}
resource "google_storage_bucket" "static-website" {
  name     = "first-terraform-bucket-496012-sa"
  location = "US"
  uniform_bucket_level_access = true
}

