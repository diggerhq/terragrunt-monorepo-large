include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/application/service-mesh-219",
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/security/waf-311",
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/application/queue-652",
    "../../../../../../../../us-west-2/dev/operations/platform/service-3/security/shield-389",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-98?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-98"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}