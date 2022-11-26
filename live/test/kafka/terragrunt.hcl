include "root" {
    path = find_in_parent_folders()
    expose = true
}

terraform {
    source = "${get_repo_root()}/modules//kafka"
}

locals {
    env = jsondecode(file(find_in_parent_folders("env.json")))
}

inputs = {
    do_token = include.root.locals.do_token
    region = local.env["REGION"]
    env = local.env["NAME"]
    vpc_uuid = "394686a4-597c-443d-8fb5-4c56f6529729"
}