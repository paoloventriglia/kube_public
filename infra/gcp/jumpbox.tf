module "jumpbox" {
  source         = "../../tf-modules/gcp/instance"
  project_id     = var.project_id
  application    = "jumpbox"
  image          = var.image
  region         = var.region
  name           = var.name
  ssh_keys       = data.template_file.ssh_keys.rendered
  startup_script = data.template_file.startup_script.rendered
  tags           = var.jumpbox_tags
}

data "template_file" "startup_script" {
  template = file("files/startup_script.sh")
}

data "template_file" "ssh_keys" {
  template = file("files/ssh-keys.conf")
}