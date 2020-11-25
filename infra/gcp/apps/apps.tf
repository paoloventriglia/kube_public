module "cloudy_d" {
  source = "../../../tf-modules/kubernetes/deployment"
  name = "cloudymation"
  container_port = 80
  image = "corebox/staticsite:latest"
  replicas = 3
  app_label = "cloudy"
}

module "cloudy_s" {
  source = "../../../tf-modules/kubernetes/service"
  app_label = module.cloudy_d.app_label
  name = "cloudymation"
  port = 80
  type = "NodePort"
}

module "cloudy_i" {
  source = "../../../tf-modules/kubernetes/ingress"
  name = "cloudymation"
  service_name = module.cloudy_s.service_name
  service_port = 80
}

module "cloudy_i_dns_record" {
  source = "../../../tf-modules/cloudfare/record"
  name   = var.name
  ip = module.cloudy_i.lb_ip
  record = "appgcp"
  ttl = "300"
  type = "A"
}