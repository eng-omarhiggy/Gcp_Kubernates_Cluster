# creating bastion
resource "google_compute_instance" "private" {
  name         = "private-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  service_account {
    email  = google_service_account.node.email
    scopes = ["cloud-platform"]
  }
  network_interface {
    network    = google_compute_network.main_vpc.id
    subnetwork = google_compute_subnetwork.management_subnet.id
  }
}
# creating SA for bastion to interactr with cluster

resource "google_service_account" "node" {
  account_id   = "node-access"
  display_name = "SA-node"
}

resource "google_project_iam_binding" "node" {
  project = "higgy-eks"
  role    = "roles/container.admin"
  members = [
    "serviceAccount:node-access@higgy-eks.iam.gserviceaccount.com",
  ]
  depends_on = [google_service_account.node]
}
# bind role  to interactr with gcr

resource "google_project_iam_binding" "kluster" {
  project = "higgy-eks"
  role    = "roles/artifactregistry.admin"
  members = [
    "serviceAccount:access@higgy-eks.iam.gserviceaccount.com",
  ]
  depends_on = [google_service_account.node]
}
