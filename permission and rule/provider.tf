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