resource "kubernetes_ingress" "ingress" {
  metadata {
    name = "${var.name}-ingress"
  }

  spec {
    backend {
      service_name = var.service_name
      service_port = var.service_port
    }
  }
}
