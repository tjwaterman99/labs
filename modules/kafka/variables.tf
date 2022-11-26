variable do_token {
    type = string
}

variable env {
    type = string
}

variable region {
    type = string
}

variable vpc_uuid {
    type = string
}

variable ssh_keys {
    type = list
    default = []
}

variable nodes {
    type = number
    default = 3
}

variable size {
    type = string
    default = "s-2vcpu-2gb"
}

variable image {
    type = string
    default = "ubuntu-22-10-x64"
}