include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/security/security-hub-403",
    "../../../../../../../../us-west-2/dev/operations/application/service-1/network/direct-connect-998",
    "../../../../../../../../us-west-2/dev/marketing/application/service-3/compute/auto-scaling-523",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-941?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-941"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}