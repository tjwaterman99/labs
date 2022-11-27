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

dependency "vpc" {
    config_path = "../vpc"
}

dependency "project" {
    config_path = "../project"
}

inputs = {
    do_token = include.root.locals.do_token
    region = local.env["REGION"]
    env = local.env["NAME"]
    vpc_uuid = dependency.vpc.outputs.vpc_id
    project_id = dependency.project.outputs.id
    ssh_keys = include.root.locals.ssh_keys
}