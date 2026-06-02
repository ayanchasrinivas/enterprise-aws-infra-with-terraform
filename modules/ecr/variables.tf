variable "ecr_mappings" {
    type = object({
        name_prefix = string
    })
}

variable "hotstar_ecr_repositories" {
    type = list(string)
}