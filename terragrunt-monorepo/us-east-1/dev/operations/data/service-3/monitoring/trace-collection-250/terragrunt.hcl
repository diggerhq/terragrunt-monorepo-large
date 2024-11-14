include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/storage/efs-574",
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/application/load-balancer-389",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/network/route-table-77",
    "../../../../../../../../us-west-2/qa/operations/data/service-2/monitoring/log-aggregation-761",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-250?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-250"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}