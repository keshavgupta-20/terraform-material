ephemeral "random_password" "db-password" {
    length  = 16
    special = true
}

resource "google_secret_manager_secret" "db_secret" {
  secret_id = "ephermal-db-password"
  replication {
    auto {}
  }
}

resource "null_resource" "store_secret" {
  provisioner "local-exec" {
    command     = "echo|set /p pwd=\"${ephemeral.random_password.db-password.result}\" > %TEMP%\\db_secret.txt && gcloud secrets versions add ${google_secret_manager_secret.db_secret.secret_id} --data-file=%TEMP%\\db_secret.txt --project=${google_secret_manager_secret.db_secret.project} && del %TEMP%\\db_secret.txt"
    interpreter = ["cmd", "/C"]
  }

  depends_on = [google_secret_manager_secret.db_secret]
}

data "google_secret_manager_secret_version" "basic" {
  secret = google_secret_manager_secret.db_secret.id
  depends_on = [null_resource.store_secret]
}
