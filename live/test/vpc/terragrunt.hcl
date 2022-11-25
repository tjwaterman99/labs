include "root" {
    path = find_in_parent_folders()
}

terraform {
    source = "${get_repo_root()}/modules//vpc"
}

locals {
    do_token = get_env("DO_TOKEN")
}

inputs = {
    do_token = local.do_token
    name = "test-vpc3"
    region = "ams3"
}