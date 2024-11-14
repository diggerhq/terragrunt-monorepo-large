include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/network/route-table-730",
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/monitoring/alertmanager-153",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/monitoring/trace-collection-27",
    "../../../../../../../../us-east-1/qa/operations/data/service-2/monitoring/log-aggregation-813",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-210?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-210"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}