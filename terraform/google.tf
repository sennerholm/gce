// Create cluster over multiple failorzones
resource "google_container_cluster" "primary" {
  name               = "production"
  zone               = "${var.gce_zone}"
  initial_node_count = 1

  additional_zones = [
    "${var.gce_zone_sec}",
    "${var.gce_zone_tert}",
  ]

  master_auth {
    username = "${var.gce_prod_username}"
    password = "${var.gce_prod_password}"
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}