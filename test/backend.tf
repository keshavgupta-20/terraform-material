terraform {
    backend "gcs"  {
        bucket = "three-tier-app-bucket-learn-terraform-496012"
        prefix =  "practice/"
    }
}