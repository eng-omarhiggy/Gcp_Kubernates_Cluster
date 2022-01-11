# create management_subnet
resource "google_compute_subnetwork" "management_subnet" {
  name          = "magnagement-subnet"
  ip_cidr_range = "10.6.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.main_vpc.id
}

#create restricted_subnet

resource "google_compute_subnetwork" "restricted_subnet" {
  name          = "restricted-subnet"
  ip_cidr_range = "10.5.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.main_vpc.id

}
