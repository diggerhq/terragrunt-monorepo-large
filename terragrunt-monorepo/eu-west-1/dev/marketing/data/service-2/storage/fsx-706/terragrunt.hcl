include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/data/service-3/network/nacl-855",
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/application/api-gateway-550",
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/monitoring/log-aggregation-798",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-2/application/cache-layer-640",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-706?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-706"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}