terraform {
    required_providers {
        google = {
            version = "7.32.0"
            source = "hashicorp/google"
        }
    }

}
provider "google" {
  project = "learn-terraform-496012"
  region  = "us-central1"
  zone    = "us-central1-a"  
  credentials = "C:/Users/KeshavGupta1/Downloads/terraform-understand/key.json"
}