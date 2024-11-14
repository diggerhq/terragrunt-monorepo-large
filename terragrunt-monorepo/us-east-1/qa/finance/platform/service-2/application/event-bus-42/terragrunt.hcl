include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/data/service-1/monitoring/log-aggregation-149",
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/application/cache-layer-903",
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/storage/fsx-532",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-42?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-42"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}