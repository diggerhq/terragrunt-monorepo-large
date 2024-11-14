include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/platform/service-3/network/direct-connect-40",
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/storage/rds-877",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-2/security/waf-179",
    "../../../../../../../../us-east-1/dev/operations/platform/service-3/application/load-balancer-610",
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/monitoring/log-aggregation-182",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-884?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-884"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}