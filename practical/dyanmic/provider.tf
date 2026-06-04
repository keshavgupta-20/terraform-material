terraform  {
    required_providers {
        google = {
            version = "7.32.0"
            source = "hashicorp/google"
        }
    }

}
provider "google" {
    credentials = "C:/Users/KeshavGupta1/Downloads/terraform-understand/key.json"
    zone = "us-central1-a"
    region = "us-central1"
    project = "learn-terraform-496012"

}



