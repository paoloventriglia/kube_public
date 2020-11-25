output "lb_ip" {
  value = kubernetes_ingress.ingress.load_balancer_ingress
}