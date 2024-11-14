include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/platform/service-1/network/vpn-676",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-3/storage/elasticache-923",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/application/cache-layer-637",
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/application/load-balancer-224",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-951?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-951"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}