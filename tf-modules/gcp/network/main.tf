locals {
  subnets = {
    for x in var.subnets :
    "${x.subnet_region}/${x.subnet_name}" => x
  }
}

resource "google_compute_network" "network" {
  name                    = "${var.name}-net"
  project                 = var.project_id
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnets" {
  provider                 = google-beta
  for_each                 = local.subnets
  name                     = each.value.subnet_name
  ip_cidr_range            = each.value.subnet_ip
  region                   = each.value.subnet_region
  private_ip_google_access = lookup(each.value, "subnet_private_access", "true")
  dynamic "log_config" {
    for_each = lookup(each.value, "subnet_flow_logs", false) ? [{
      aggregation_interval = lookup(each.value, "subnet_flow_logs_interval", null)
      flow_sampling        = lookup(each.value, "subnet_flow_logs_sampling", null)
      metadata             = lookup(each.value, "subnet_flow_logs_metadata", null)
    }] : []
    content {
      aggregation_interval = log_config.value.aggregation_interval
      flow_sampling        = log_config.value.flow_sampling
      metadata             = log_config.value.metadata
    }
  }
  network     = google_compute_network.network.name
  project     = var.project_id
  description = lookup(each.value, "description", null)
  secondary_ip_range = [
    for i in range(
      length(
        contains(
        keys(var.secondary_ranges), each.value.subnet_name) == true
        ? var.secondary_ranges[each.value.subnet_name]
        : []
    )) :
    var.secondary_ranges[each.value.subnet_name][i]
  ]

  purpose = lookup(each.value, "purpose", null)
  role    = lookup(each.value, "role", null)
}

resource "google_compute_firewall" "ssh-ingress" {
  name    = "ssh-ingress"
  project = var.project_id
  network = google_compute_network.network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags = ["ssh-ingress"]

  source_ranges = var.source_ranges
}

resource "google_compute_firewall" "http-ingress" {
  name    = "http-ingress"
  project = var.project_id
  network = google_compute_network.network.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  target_tags = ["http-ingress"]

  source_ranges = var.source_ranges
}

resource "google_compute_router" "router" {
  name    = "${var.name}-router"
  region  = var.region
  network = google_compute_network.network.self_link
  project = var.project_id

  depends_on = [google_compute_subnetwork.subnets, google_compute_network.network]
}

resource "google_compute_router_nat" "nat" {
  name                               = "${var.name}-nat"
  project                            = var.project_id
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = "projects/${var.project_id}/regions/${var.region}/subnetworks/${var.name}-sub-${var.region}"
    source_ip_ranges_to_nat = ["PRIMARY_IP_RANGE"]
  }

  depends_on = [google_compute_subnetwork.subnets, google_compute_network.network]
}