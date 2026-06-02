variable "efs_mappings" {
    type = object({
        name_prefix = string
    })
}

variable "subnet_ids" {
    type = list(string)
}

variable "security_group_id" {
  type        = string
  description = "The security group ID assigned to the EFS mount targets"
}