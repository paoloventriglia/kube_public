resource "google_container_cluster" "main" {
  name = "gke-${var.name}-cluster"
  project = var.project_id
  location = var.zone
  initial_node_count = var.initial_node_count
  remove_default_node_pool = true
  network = var.network
  subnetwork = "projects/${var.project_id}/regions/${var.region}/subnetworks/${var.name}-sub-${var.region}"

  ip_allocation_policy {
    cluster_secondary_range_name = "${var.name}-sub-${var.region}-pods"
    services_secondary_range_name = "${var.name}-sub-${var.region}-services"
  }

    private_cluster_config {
      enable_private_endpoint = true
      enable_private_nodes = true
      master_ipv4_cidr_block = var.master_cidr
    }

    master_authorized_networks_config {
      cidr_blocks {
        cidr_block = var.auth_net
      }
    }

  depends_on = [var.gke_depends_on]


  }


resource "google_container_node_pool" "main" {
  name              = "gke-${var.name}-node-pool"
  project           = var.project_id
  cluster           = google_container_cluster.main.name
  location          = var.zone
  node_count        = var.node_count
  max_pods_per_node = var.max_pods_per_node

  node_config {
    preemptible  = true
    machine_type = var.gke_machine_type
    disk_size_gb = 20
  }
}