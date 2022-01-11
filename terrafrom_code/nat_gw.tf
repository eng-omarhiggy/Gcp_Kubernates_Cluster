
# creating router
resource "google_compute_router" "router" {
  name    = "nat-router"
  network = google_compute_network.main_vpc.id
}


# Nat Getway
resource "google_compute_router_nat" "nat" {
  name                               = "privet-nat2"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "AUTO_ONLY"
  subnetwork {
    name                    = google_compute_subnetwork.management_subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}
# firewall allow Iap access only 
resource "google_compute_firewall" "allow_iap" {
  name    = "allow-iap"
  network = google_compute_network.main_vpc.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["35.235.240.0/20"]

}