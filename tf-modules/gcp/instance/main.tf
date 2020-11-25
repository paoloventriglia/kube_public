resource "google_compute_instance" "main" {
  name         = "${var.name}-${var.application}"
  project      = var.project_id
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
      size  = 20
      type  = "pd-standard"
    }
  }

  network_interface {
    subnetwork = "projects/${var.project_id}/regions/${var.region}/subnetworks/${var.name}-sub-${var.region}"

    access_config {}
  }

  tags = var.tags


  metadata = {
    startup-script = var.startup_script
    ssh-keys = var.ssh_keys
  }

  service_account {
    scopes = [
    "cloud-platform"]
  }

  depends_on = [var.vm_depends_on]
}
