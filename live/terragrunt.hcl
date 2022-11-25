remote_state {
    backend = "local" 
    config = {
        path = "${get_terragrunt_dir()}/terraform.tfstate"
    }
}

generate "backend" {
    path = "backend.tf"
    if_exists = "overwrite"
    contents = <<EOF
terraform {
  backend "local" {}
}
EOF
}