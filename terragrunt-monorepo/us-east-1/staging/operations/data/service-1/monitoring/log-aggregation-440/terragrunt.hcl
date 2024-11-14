include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/monitoring/prometheus-315",
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/monitoring/alertmanager-539",
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/monitoring/cloudwatch-327",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-440?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-440"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}