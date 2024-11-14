include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/storage/rds-493",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/security/shield-152",
    "../../../../../../../../us-west-2/dev/finance/application/service-3/network/route-table-193",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-804?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-804"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}