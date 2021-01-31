module "gke" {
  source         = "../../../kube_public/tf-modules/gcp/gke"
  project_id     = var.project_id
  name           = var.name
  region         = var.region
  network        = module.network.network_self_link
  auth_net       = var.auth_net
  master_cidr    = var.master_cidr
  gke_depends_on = module.network.subnets
}