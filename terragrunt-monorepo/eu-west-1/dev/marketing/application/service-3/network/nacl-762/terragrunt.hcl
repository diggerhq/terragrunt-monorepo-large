include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/application/service-1/storage/rds-332",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/monitoring/log-aggregation-373",
    "../../../../../../../../us-east-1/dev/finance/data/service-2/security/waf-106",
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/application/event-bus-555",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/monitoring/alertmanager-481",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//nacl-762?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "nacl-762"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}