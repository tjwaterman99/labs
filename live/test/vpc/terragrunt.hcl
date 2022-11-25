include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_repo_root()}/modules//vpc"
}

locals {
  do_token   = get_env("DO_TOKEN")
  env_config = jsondecode(file(find_in_parent_folders("env.json")))
  env        = local.env_config["NAME"]
  region     = local.env_config["REGION"]
}

inputs = {
  do_token = local.do_token
  name     = "vpc-${local.region}-${local.env}"
  region   = "${local.region}"
}