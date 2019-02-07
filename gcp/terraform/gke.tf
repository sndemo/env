variable "cluster_name" {
  default = "s12n"
}

variable "project" {
  default = "softwarization-230908"
}

variable "region" {
  default = "us-west1"
}

provider "google" {
  region = "${var.region}"
}

resource "google_compute_route" "default" {
  name        = "${var.cluster_name}-network-route"
  project     = "${var.project}"
  dest_range  = "0.0.0.0/0"
  network     = "${google_compute_network.default.name}"
  next_hop_gateway = "default-internet-gateway"
}

resource "google_compute_network" "default" {
  name                    = "${var.cluster_name}-network"
  project                 = "${var.project}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "default" {
  name                     = "${var.cluster_name}-subnetwork"
  region                  = "${var.region}"
  project                 = "${var.project}"
  ip_cidr_range            = "10.127.0.0/20"
  network                  = "${google_compute_network.default.name}"
  private_ip_google_access = true
}

resource "google_container_node_pool" "default" {
  name       = "${var.cluster_name}-node-pool"
  project                 = "${var.project}"
  cluster    = "${google_container_cluster.default.name}"
  zone       = "${var.region}-a"
  node_count = 1

  node_config {
    machine_type = "n1-standard-2"
    
    oauth_scopes = [
      "compute-rw",
      "storage-ro",
      "logging-write",
      "monitoring",
    ]

    labels {
      for = "ReferenceArchitecture"
    }

    tags = ["softwarization", "s12n"]
  }

  autoscaling {
    min_node_count = 2
    max_node_count = 4
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }
}


resource "google_container_cluster" "default" {
  name               = "${var.cluster_name}-cluster"
  project            = "${var.project}"
  zone               = "${var.region}-a"
  remove_default_node_pool = true
  
  network            = "${google_compute_network.default.name}"
  subnetwork         = "${google_compute_subnetwork.default.name}"

  additional_zones = [
    "${var.region}-b",
  ]

  lifecycle {
    ignore_changes = ["node_pool"]
  }

  node_pool {
    name = "default-pool"
  }

}

# The following outputs allow authentication and connectivity to the GKE Cluster.
output "client_certificate" {
  value = "${google_container_cluster.default.master_auth.0.client_certificate}"
}

output "client_key" {
  value = "${google_container_cluster.default.master_auth.0.client_key}"
}

output "cluster_ca_certificate" {
  value = "${google_container_cluster.default.master_auth.0.cluster_ca_certificate}"
}
