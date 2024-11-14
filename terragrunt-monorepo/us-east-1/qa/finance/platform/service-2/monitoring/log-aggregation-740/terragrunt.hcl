include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/application/service-3/compute/spot-fleet-795",
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/storage/rds-739",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/compute/auto-scaling-686",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/monitoring/grafana-500",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-3/compute/batch-878",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-740?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-740"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}