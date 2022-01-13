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
    email  = google_service_account.access.email
    scopes = ["cloud-platform"]
  }
  network_interface {
    network    = google_compute_network.main_vpc.id
    subnetwork = google_compute_subnetwork.management_subnet.id
  }
}
