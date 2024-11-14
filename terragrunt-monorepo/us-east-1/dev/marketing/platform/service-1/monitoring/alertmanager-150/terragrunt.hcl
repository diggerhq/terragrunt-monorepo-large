include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/network/route-table-231",
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/security/secrets-831",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/network/transit-gateway-942",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/network/nacl-613",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-150?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-150"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}