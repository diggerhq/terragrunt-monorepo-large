include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/application/cache-layer-179",
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/security/waf-545",
    "../../../../../../../../us-west-2/dev/finance/application/service-2/network/transit-gateway-130",
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/security/shield-480",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/security/guardduty-532",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-273?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-273"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}