terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.32.0"
    }
  }

}
provider "google" {
  project     = "learn-terraform-496012"
  region      = "us-central1"
  zone        = "us-central1-a"
  credentials = "C:/Users/KeshavGupta1/Downloads/terraform-understand/key.json"
}


