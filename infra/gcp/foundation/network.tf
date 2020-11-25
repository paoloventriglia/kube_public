module "network" {
  source           = "../../../tf-modules/gcp/network"
  subnets          = var.subnets
  name             = var.name
  project_id       = var.project_id
  secondary_ranges = var.secondary_ranges
  source_ranges    = var.source_ranges
}