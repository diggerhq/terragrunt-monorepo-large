include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/network/nacl-289",
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/compute/auto-scaling-191",
    "../../../../../../../../us-west-2/qa/operations/application/service-2/security/guardduty-357",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/network/vpn-220",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-261?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-261"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}