vpc_mappings = {
  environment          = "DEV"
  name                 = "DEV-VPC"
  team                 = "DEVOPS"
  name_prefix          = "DEV"
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

ec2_mappings = {
    name_prefix = "DEV"
    instance_type = "t3.micro"
    instance_count = 2
    ami_id = "ami-0388e3ada3d9812da"
    volume_size = "20"
    volume_type = "gp3"
}

iam_mappings = {
    name_prefix = "DEV"
}

iam_devops_users = ["srinivas","arun"]

lightsail_mappings = {
    instance_count = 2
    name_prefix = "DEV"
    blueprint_id = "amazon_linux_2"
    bundle_id = "micro_3_0"
    key_pair_name = "srinivas"
}

ecr_mappings = {
    name_prefix = "DEV"
}

hotstar_ecr_repositories = ["backend", "frontend", "database", "ingress"]

efs_mappings = {
    name_prefix = "DEV"
}

alb_mappings = {
    name_prefix = "DEV"
}