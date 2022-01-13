# creating SV with clusterAdmin role
resource "google_service_account" "access" {
  account_id   = "access"
  display_name = "SA"
}

resource "google_project_iam_binding" "klusterr" {
  project = "higgy-ekss"
  role    = "roles/container.admin"
  members = [
    "serviceAccount:access@higgy-ekss.iam.gserviceaccount.com",
  ]
  depends_on = [google_service_account.access]
}


resource "google_project_iam_binding" "gcr" {
  project = "higgy-ekss"
  role    = "roles/storage.objectAdmin"
  members = [
    "serviceAccount:access@higgy-ekss.iam.gserviceaccount.com",
  ]
  depends_on = [google_service_account.access]
}
