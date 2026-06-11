terraform  {
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "7.32.0"
        }
    }
}
provider "google"{
    zone = "us-central1-a"
    region = "us-central"
   project = "learn-terraform-496012"
    credentials = "C:/Users/KeshavGupta1/Downloads/terraform-understand/key.json"
}