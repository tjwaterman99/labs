terraform {
    source = "${get_repo_root()}/modules//vpc"
}

locals {
    do_token = get_env("DO_TOKEN")
}

inputs = {
    do_token = local.do_token
    name = "test-vpc"
    region = "ams3"
}