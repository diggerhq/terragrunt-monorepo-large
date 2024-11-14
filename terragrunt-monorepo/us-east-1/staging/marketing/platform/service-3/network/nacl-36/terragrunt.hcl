include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/application/cache-layer-510",
    "../../../../../../../../us-west-2/dev/finance/application/service-2/storage/elasticache-913",
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/security/security-hub-193",
    "../../../../../../../../us-east-1/qa/marketing/data/service-3/monitoring/alertmanager-377",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/network/route-table-563",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//nacl-36?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "nacl-36"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}