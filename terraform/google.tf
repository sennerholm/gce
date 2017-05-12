// Create cluster over multiple failorzones
resource "google_container_cluster" "production" {
  name               = "production"
  zone               = "${var.gce_zone}"
  initial_node_count = 3
  node_version = "1.6.2"

  master_auth {
    username = "${var.gce_username}"
    password = "${var.gce_prod_password}"
  }

  node_config {
    machine_type = "n1-standard-1"
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

resource "google_container_cluster" "build" {
  name               = "build"
  zone               = "${var.gce_zone}"
  initial_node_count = 2
  node_version = "1.6.2"

  master_auth {
    username = "${var.gce_username}"
    password = "${var.gce_build_password}"
  }

  node_config {
    machine_type = "n1-standard-1"
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

resource "google_container_cluster" "test" {
  name               = "test"
  zone               = "${var.gce_zone}"
  initial_node_count = 1
  node_version = "1.6.2"

  additional_zones = [
    "${var.gce_zone_sec}",
    "${var.gce_zone_tert}",
  ]

  master_auth {
    username = "${var.gce_username}"
    password = "${var.gce_test_password}"
  }

  node_config {
    machine_type = "n1-standard-1"
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

resource "google_compute_disk" "go_data" {
  name  = "production-go-data"
  type  = "pd-standard"
  zone  = "${var.gce_zone}"
  size  = "100"
}

resource "google_compute_disk" "go_datadb" {
  name  = "production-go-data-db"
  type  = "pd-ssd"
  zone  = "${var.gce_zone}"
  size  = "10"
}
