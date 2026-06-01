variable "security_group_mappings" {
    description = "security_group_mappings"
    type = object({
        name_prefix = string
        name = string
        environment = string
        team = string
    })
}

variable "security_group_vpc_id" {
    description = "security_group_vpc_id"
    type = string
}


variable "admin_cidrs" {
    description = "allowed_ingress_cidrs"
    type = list(string)
    default = []
}