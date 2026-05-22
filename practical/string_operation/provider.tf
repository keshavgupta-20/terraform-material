terraform{
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "7.32.0"
        }
        
    }
   
}
provider "google" {
    project= var.project_id
    region = var.region
    zone = var.zone
    credentials = "C:/Users/KeshavGupta1/Downloads/terraform-understand/key.json"
}