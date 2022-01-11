# creating SV with clusterAdmin role
resource "google_service_account" "access" {
  account_id   = "access"
  display_name = "SA"
}

resource "google_project_iam_binding" "kluster" {
  project = "higgy-eks"
  role    = "roles/container.clusterAdmin"
  members = [
    "serviceAccount:access@higgy-eks.iam.gserviceaccount.com",
  ]
  depends_on = [google_service_account.access]
}

