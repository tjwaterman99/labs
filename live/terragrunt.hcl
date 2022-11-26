remote_state {
  backend = "local"
  config = {
    path = "${get_terragrunt_dir()}/terraform.tfstate"
  }
}

locals {
  do_token = get_env("DO_TOKEN")

  # We should ideally use different ssh keys for each node, but it's
  # much simpler to start with a shared key
  ssh_keys = ["49:a2:7e:c5:47:f8:a6:41:5d:e4:3c:7a:5a:90:fb:40"]
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
  backend "local" {}
}
EOF
}