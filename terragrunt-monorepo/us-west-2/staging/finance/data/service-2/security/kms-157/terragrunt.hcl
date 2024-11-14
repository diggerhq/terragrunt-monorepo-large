include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/data/service-2/network/route-table-799",
    "../../../../../../../../us-east-1/staging/finance/platform/service-2/security/waf-295",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/compute/auto-scaling-938",
    "../../../../../../../../us-east-1/dev/operations/platform/service-3/security/guardduty-652",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//kms-157?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "kms-157"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}