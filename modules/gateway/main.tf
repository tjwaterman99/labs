terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

locals {
    node_id = "${var.env}-${var.region}-gateway"
}

resource "digitalocean_droplet" "gateway" {
  image  = var.image
  name   = "${local.node_id}"
  region = var.region
  size   = var.size
  vpc_uuid = var.vpc_uuid
  ssh_keys = var.ssh_keys
}

resource "digitalocean_project_resources" "gateway" {
  project = var.project_id
  resources = [ digitalocean_droplet.gateway.urn ]
}