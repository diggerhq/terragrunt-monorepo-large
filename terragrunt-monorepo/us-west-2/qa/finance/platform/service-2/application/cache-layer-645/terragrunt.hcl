include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/application/service-1/storage/elasticache-165",
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/security/security-hub-327",
    "../../../../../../../../us-west-2/qa/operations/application/service-3/network/direct-connect-51",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/network/transit-gateway-238",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-645?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-645"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}