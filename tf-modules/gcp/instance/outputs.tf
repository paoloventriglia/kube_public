output "vm_ip" {
  value = google_compute_instance.main.network_interface[0].network_ip
}

output "vm_ext_ip" {
  value = google_compute_instance.main.network_interface[0].access_config
}