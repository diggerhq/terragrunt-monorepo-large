include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/monitoring/log-aggregation-133",
    "../../../../../../../../eu-west-1/staging/finance/data/service-1/application/cache-layer-573",
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/monitoring/alertmanager-945",
    "../../../../../../../../us-east-1/qa/finance/application/service-3/compute/auto-scaling-587",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-869?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-869"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}