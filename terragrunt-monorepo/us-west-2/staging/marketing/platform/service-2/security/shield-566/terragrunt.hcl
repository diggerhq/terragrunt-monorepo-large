include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/monitoring/alertmanager-36",
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/security/waf-986",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/storage/rds-100",
    "../../../../../../../../us-west-2/dev/marketing/application/service-2/monitoring/log-aggregation-478",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-566?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-566"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}