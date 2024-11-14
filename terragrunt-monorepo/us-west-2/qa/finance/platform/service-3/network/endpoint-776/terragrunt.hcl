include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/data/service-1/network/direct-connect-27",
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/network/vpn-943",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-2/compute/spot-fleet-8",
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/security/waf-528",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-776?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-776"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}