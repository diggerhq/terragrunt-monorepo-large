include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/network/route-table-225",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-1/application/queue-887",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/application/load-balancer-341",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-2/monitoring/trace-collection-69",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-3?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-3"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}