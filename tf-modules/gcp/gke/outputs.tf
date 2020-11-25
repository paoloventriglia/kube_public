output "google_container_cluster_endpoint" {
  value = google_container_cluster.main.endpoint
}

output "google_container_cluster_client_certificate" {
  value = google_container_cluster.main.master_auth[0].client_certificate
}

output "google_container_cluster_client_key" {
  value = google_container_cluster.main.master_auth[0].client_key
}

output "google_container_cluster_client_cluster_ca_certificate" {
  value = google_container_cluster.main.master_auth[0].cluster_ca_certificate
}