include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-3/monitoring/log-aggregation-49",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/security/guardduty-203",
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/storage/rds-922",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-3/network/direct-connect-489",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-549?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-549"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}