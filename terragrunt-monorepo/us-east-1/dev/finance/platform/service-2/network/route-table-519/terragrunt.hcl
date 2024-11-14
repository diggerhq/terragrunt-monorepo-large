include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/platform/service-1/security/shield-659",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/security/shield-912",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-519?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-519"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}