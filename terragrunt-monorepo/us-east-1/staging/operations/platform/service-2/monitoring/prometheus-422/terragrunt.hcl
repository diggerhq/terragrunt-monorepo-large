include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/application/service-3/application/queue-807",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/network/endpoint-498",
    "../../../../../../../../us-east-1/staging/finance/platform/service-1/monitoring/log-aggregation-513",
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/security/shield-183",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-422?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-422"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}