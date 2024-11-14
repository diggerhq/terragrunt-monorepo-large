include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/application/cache-layer-61",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-1/network/endpoint-482",
    "../../../../../../../../us-east-1/qa/marketing/application/service-2/monitoring/log-aggregation-990",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-144?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-144"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}