include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/data/service-2/network/endpoint-924",
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/storage/redshift-274",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-3/application/cache-layer-280",
    "../../../../../../../../us-east-1/qa/finance/data/service-1/network/endpoint-153",
    "../../../../../../../../us-east-1/qa/operations/application/service-1/monitoring/log-aggregation-614",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-373?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-373"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}