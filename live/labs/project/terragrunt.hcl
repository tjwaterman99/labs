terraform {
    source = "${get_repo_root()}/modules//project"
}

include root {
    path = find_in_parent_folders()
    expose = true
}

locals {
    env = jsondecode(file(find_in_parent_folders("env.json")))
}

inputs = {
    do_token = include.root.locals.do_token
    name = local.env["NAME"]
    purpose = "Projects for various labs"
}