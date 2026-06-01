vpc_mappings = {
  environment          = "PROD"
  name                 = "PROD-VPC"
  team                 = "DEVOPS"
  name_prefix          = "PROD-VPC"
  vpc_cidr             = "10.40.0.0/16"
  az_count             = 2
  enable_dns_hostnames = true
  enable_dns_support   = true
  public_type = "public"
  private_type = "private"
  single_nat_gateway = true
}

security_group_mappings = {
  name_prefix = "DEV"
  name = "DEV"
  environment = "DEV"
  team = "DEVOPS"
}