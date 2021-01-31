module "runner" {
  source         = "../../../kube_public/tf-modules/gcp/instance"
  project_id     = var.project_id
  application    = "runner"
  image          = var.runner_image
  region         = var.region
  name           = var.name
  ssh_keys       = data.template_file.ssh_keys.rendered
  startup_script = data.template_file.startup_script.rendered
  tags           = var.runner_tags
  vm_depends_on  = module.gke
}

data "template_file" "ssh_keys" {
  template = file("files/ssh-keys.conf")
}

data "template_file" "startup_script" {
  template = file("files/startup_script.sh")
}