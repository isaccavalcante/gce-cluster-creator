// Testing Static IP
//resource "google_compute_address" "test-static-ip-address" {
//  name = "my-test-static-ip-address"
//}

resource "google_compute_instance" "my-instance" {
  name         = "cluster-node-${count.index}"
  machine_type = "n1-standard-1"
  zone         = "us-west1-a"
  count        = 1
  tags         = ["web"]

   boot_disk {
      initialize_params {
        image = "ubuntu-1804-lts"
        size = 15
        type = "pd-ssd"
      }
   }

  # SSH configuration
  metadata {
    ssh-keys = "myuser:${file("~/.ssh/id_rsa.pub")}"
  }

  network_interface {
    network = "default"
    access_config {
      //nat_ip = "${google_compute_address.test-static-ip-address.address}"
    }
  }


   metadata_startup_script = <<SCRIPT
      apt update -y
      apt install python -y
    SCRIPT


}

output "ip" {
  value = "${google_compute_instance.my-instance.network_interface.0.access_config.0.nat_ip}"
}