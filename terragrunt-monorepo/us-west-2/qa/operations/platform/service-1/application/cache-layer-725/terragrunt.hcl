include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/platform/service-3/network/vpn-485",
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/compute/spot-fleet-70",
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/security/secrets-991",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/network/nacl-956",
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/application/service-mesh-548",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-725?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-725"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}