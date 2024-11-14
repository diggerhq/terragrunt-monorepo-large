include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/network/direct-connect-354",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/compute/spot-fleet-713",
    "../../../../../../../../us-east-1/staging/marketing/application/service-2/security/secrets-292",
    "../../../../../../../../us-east-1/dev/operations/application/service-2/compute/auto-scaling-399",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-737?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-737"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}