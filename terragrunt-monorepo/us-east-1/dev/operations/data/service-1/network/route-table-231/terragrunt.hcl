include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/data/service-2/compute/spot-fleet-8",
    "../../../../../../../../us-east-1/dev/finance/data/service-3/monitoring/trace-collection-825",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/network/route-table-806",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-231?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-231"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}