include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/network/transit-gateway-676",
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/security/shield-651",
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/security/shield-23",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/security/iam-505",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-598?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-598"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}