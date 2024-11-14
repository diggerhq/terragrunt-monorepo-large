include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/storage/dynamodb-654",
    "../../../../../../../../us-west-2/qa/finance/application/service-1/application/queue-270",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/compute/batch-562",
    "../../../../../../../../us-east-1/staging/finance/application/service-3/monitoring/log-aggregation-502",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-671?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-671"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}