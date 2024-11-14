include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/network/route-table-503",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/monitoring/log-aggregation-497",
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/security/iam-167",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/compute/lambda-13",
    "../../../../../../../../us-east-1/staging/finance/platform/service-2/security/secrets-964",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-81?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-81"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}