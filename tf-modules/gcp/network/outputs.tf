output "network_self_link" {
  value = google_compute_network.network.self_link
  description = ""
}

output "subnets" {
  value       = google_compute_subnetwork.subnets
  description = "The created subnet resources"
}