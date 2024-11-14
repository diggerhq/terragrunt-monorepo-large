include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/platform/service-1/application/event-bus-682",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-2/application/cache-layer-638",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-3/security/shield-915",
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/storage/redshift-847",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/security/guardduty-583",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-309?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-309"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}