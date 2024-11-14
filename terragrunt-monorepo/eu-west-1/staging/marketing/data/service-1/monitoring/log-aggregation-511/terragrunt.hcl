include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/application/service-3/security/shield-523",
    "../../../../../../../../eu-west-1/dev/operations/data/service-1/network/nacl-347",
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/storage/fsx-766",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/network/endpoint-527",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-511?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-511"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}