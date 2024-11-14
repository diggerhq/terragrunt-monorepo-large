include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/monitoring/log-aggregation-159",
    "../../../../../../../../us-east-1/dev/finance/data/service-3/storage/fsx-89",
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/network/endpoint-47",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-369?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-369"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}