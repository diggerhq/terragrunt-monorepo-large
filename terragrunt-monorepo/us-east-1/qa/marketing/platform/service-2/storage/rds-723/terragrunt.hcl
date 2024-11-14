include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/data/service-2/monitoring/alertmanager-707",
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/application/cache-layer-475",
    "../../../../../../../../us-west-2/staging/operations/platform/service-2/monitoring/cloudwatch-332",
    "../../../../../../../../us-west-2/dev/marketing/application/service-2/monitoring/log-aggregation-274",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-723?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-723"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}