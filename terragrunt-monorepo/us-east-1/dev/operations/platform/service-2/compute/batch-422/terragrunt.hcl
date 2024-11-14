include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/network/direct-connect-275",
    "../../../../../../../../us-east-1/qa/marketing/application/service-2/compute/spot-fleet-497",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/application/cache-layer-942",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-422?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-422"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}