resource "google_container_cluster" "primary" {
  name     = var.project_name
  project  = var.project_name
  location = var.zone_name

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = "default"
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "${google_container_cluster.primary.name}-node-pool"
  project    = var.project_name
  location   = var.zone_name
  cluster    = google_container_cluster.primary.name
  node_count = var.gke_num_nodes

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    machine_type = var.gke_machine_type
  }
}
