include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/application/service-1/security/secrets-375",
    "../../../../../../../../us-west-2/dev/finance/application/service-3/application/cache-layer-510",
    "../../../../../../../../us-east-1/staging/finance/data/service-1/application/event-bus-23",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-3/network/vpn-773",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-349?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-349"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}