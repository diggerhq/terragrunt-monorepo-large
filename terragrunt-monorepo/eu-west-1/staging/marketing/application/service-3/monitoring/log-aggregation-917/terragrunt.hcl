include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/application/service-3/monitoring/log-aggregation-277",
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/network/endpoint-911",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/security/security-hub-350",
    "../../../../../../../../eu-west-1/dev/finance/data/service-3/compute/batch-271",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-917?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-917"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}