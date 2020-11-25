module "jenkins" {
  source         = "../../../tf-modules/gcp/instance"
  project_id     = var.project_id
  application    = "jenkins"
  image          = var.image
  region         = var.region
  name           = var.name
  ssh_keys       = data.template_file.ssh_keys.rendered
  tags           = var.jenkins_tags
  vm_depends_on  = module.network.subnets
}

module "jenkins_dns" {
  source = "../../../tf-modules/cloudfare/record"
  name   = var.name
  ip     = lookup(module.jenkins.vm_ext_ip[0], "nat_ip")
  record = "jenkins-gcp"
  ttl    = "300"
  type   = "A"
}

data "template_file" "ssh_keys" {
  template = file("../files/ssh-keys.conf")
}