resource "google_project_iam_member" "compute_instance_admin" {
  project = "learn-terraform-496012"
  role    = "roles/compute.instanceAdmin.v1"
  member  = "serviceAccount:terraform-gcp-sa@learn-terraform-496012.iam.gserviceaccount.com"
}
resource "google_project_service" "compute_api" {
  project = "learn-terraform-496012"
  service = "compute.googleapis.com"

  disable_on_destroy = false  # keeps API enabled even after terraform destroy
}

resource "google_project_iam_member" "compute_admin" {
  project = "learn-terraform-496012"
  role    = "roles/compute.admin"
  member  = "serviceAccount:terraform-gcp-sa@learn-terraform-496012.iam.gserviceaccount.com"
}