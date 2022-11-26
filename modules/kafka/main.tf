terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

locals {
    node_id = "kafka-${var.region}-${var.env}"
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