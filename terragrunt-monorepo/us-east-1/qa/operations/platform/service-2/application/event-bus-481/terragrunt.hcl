include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/application/cache-layer-510",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-3/security/shield-915",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-3/network/nacl-885",
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/security/security-hub-913",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-481?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-481"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}