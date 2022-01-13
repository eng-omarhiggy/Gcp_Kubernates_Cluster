resource "google_compute_network" "main_vpc" {
  project                 = "higgy-ekss"
  name                    = "main-vpc2"
  auto_create_subnetworks = false
}