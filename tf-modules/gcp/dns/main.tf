resource "google_dns_managed_zone" "zone" {
  name        = "${var.name}-zone"
  project     = var.project_id
  dns_name    = "gcp.${var.name}.com."
  description = "${var.name} DNS zone"
}