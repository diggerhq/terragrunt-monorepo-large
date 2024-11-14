include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-2/network/route-table-6",
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/security/shield-158",
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/network/vpc-903",
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/network/vpn-420",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-268?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-268"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}