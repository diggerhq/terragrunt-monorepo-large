include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/application/cache-layer-376",
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/network/subnet-5",
    "../../../../../../../../us-west-2/qa/finance/application/service-1/compute/auto-scaling-806",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-713?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-713"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}