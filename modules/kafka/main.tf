terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

locals {
    node_id = "${var.env}-${var.region}-kafka"
}

resource "digitalocean_droplet" "kafka" {
  count = var.nodes
  image  = var.image
  name   = "${local.node_id}-${count.index}"
  region = var.region
  size   = var.size
  vpc_uuid = var.vpc_uuid
  ssh_keys = var.ssh_keys
}

resource "digitalocean_project_resources" "kafka_nodes" {
  project = var.project_id
  resources = [ for node in digitalocean_droplet.kafka : node.urn ]
}