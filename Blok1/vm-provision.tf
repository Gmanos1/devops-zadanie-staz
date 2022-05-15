provider "google" {
  project = var.project_name
  region  = var.region_name
  zone    = var.zone_name
}

resource "google_compute_instance" "vm_instance" {
  name         = var.vm_instance_name
  machine_type = var.vm_machine_type

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
      network = "default"
      access_config {
        
      }
  }
}
