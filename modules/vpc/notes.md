Variables
-------------
name_prefix
vpc_cidr
az_count
single_nat_gateway

Outputs
----------
vpc_id  
vpc_cidr
public_subnet_ids
private_subnet_ids
database_subnet_ids

Resources
--------------------
aws_vpc
aws_subnet - public
aws_subnet - private
aws_subnet - database
aws_internet_gateway
aws_eip [required for NAT]
aws_nat_gateway
aws_route_table - public rt
aws_route_table_association - with public subnets
aws_route_table - private rt
aws_route_table_association - with private subnets
aws_route_table - database rt
aws_route_table_association - with database subnets


All the values are not passed at the subnet level.
That is intentional because this is a reusable module. The value is passed from the root/live stack here:


Untouched reuseble code should be under modules folder.
All the values should be declared at the root mani.tf file level.

here in this project they have maintained two folder
first one for modules - which contains the static code with no values at all.

second one for live infra where the root main file exists.
under it variables.tf file is declared.
it contains the values.




modules/vpc - CHILD MODULE
Variables declared here are ONLY for this module.
Hey whoever calls this module must provide vpc_mappings

live/infra - ROOT MODULE
This is where module gets called, you must pass values somehow.
module "hotstar_vpc" {}

Two Ways To Pass Values
OPTION 1 — Direct Hardcoding
OPTION 2 — Root Variables + tfvars (Production)