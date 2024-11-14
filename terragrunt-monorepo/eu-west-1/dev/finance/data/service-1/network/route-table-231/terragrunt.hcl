include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/platform/service-1/security/security-hub-100",
    "../../../../../../../../us-east-1/staging/finance/data/service-1/security/guardduty-185",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/compute/auto-scaling-385",
    "../../../../../../../../us-east-1/staging/finance/application/service-3/storage/rds-945",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/security/iam-21",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-231?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-231"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}