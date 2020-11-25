data "google_compute_network" "net" {
  name    = "${var.name}-net"
  project = var.project_id
}

module "gke" {
  source         = "../../tf-modules/gcp/gke"
  project_id     = var.project_id
  name           = var.name
  region         = var.region
  network        = data.google_compute_network.net.self_link
  auth_net       = var.auth_net
  master_cidr    = var.master_cidr
}