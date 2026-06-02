variable "vpc_mappings" {
    description = "vpc_mappings"
    type = object({
        environment = string
        name = string
        team = string
        name_prefix = string
        vpc_cidr = string
        az_count = number
        enable_dns_support = bool
        enable_dns_hostnames = bool
    })
}