# creating the cluster with privet ip 
resource "google_container_cluster" "primary" {
  name               = "python-weebapp"
  location           = "us-central1-a"
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

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "10.7.0.0/16"
    services_ipv4_cidr_block = "10.8.0.0/16"
  }

  private_cluster_config {
    master_ipv4_cidr_block  = "172.16.0.0/28"
    enable_private_nodes    = true
    enable_private_endpoint = true
  }
}

resource "google_container_node_pool" "project_pool" {
  name       = "my-node-pool"
  location   = "us-central1-a"
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible     = false
    machine_type    = "e2-micro"
    service_account = google_service_account.access.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}