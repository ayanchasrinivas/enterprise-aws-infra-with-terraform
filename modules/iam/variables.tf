variable "iam_mappings" = {
    type = object({
        name_prefix = string
    })
}

variable "iam_devops_users" {
    type = list(string)
    default = []
}