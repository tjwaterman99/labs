include "root" {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "${get_repo_root()}/modules//vpc"
}

locals {
  env_config = jsondecode(file(find_in_parent_folders("env.json")))
  env        = local.env_config["NAME"]
  region     = local.env_config["REGION"]
}

inputs = {
  do_token = include.root.locals.do_token
  name     = "vpc-${local.region}-${local.env}"
  region   = "${local.region}"
}