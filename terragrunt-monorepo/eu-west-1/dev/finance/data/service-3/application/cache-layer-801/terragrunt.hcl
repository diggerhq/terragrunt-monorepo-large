include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/platform/service-1/network/direct-connect-651",
    "../../../../../../../../us-west-2/staging/operations/platform/service-1/application/load-balancer-503",
    "../../../../../../../../us-east-1/qa/marketing/application/service-2/application/event-bus-777",
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/monitoring/cloudwatch-426",
    "../../../../../../../../eu-west-1/qa/finance/data/service-2/storage/backup-916",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-801?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-801"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}