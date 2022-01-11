# creating the cluster with privet ip 
resource "google_container_cluster" "primary" {
  name               = "python-weebapp"
  location           = "us-central1"
  initial_node_count = 1
  enable_autopilot   = false
  network            = google_compute_network.main_vpc.id
  subnetwork         = google_compute_subnetwork.restricted_subnet.id
# Granting authrized neworks
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "10.6.0.0/16"
      display_name = "trusted"
    }
  }
  # binding sa to interact with 
  node_config {
    service_account = google_service_account.access.email

  }
  private_cluster_config {
    master_ipv4_cidr_block  = "172.16.0.0/28"
    enable_private_nodes    = true
    enable_private_endpoint = true
  }
}