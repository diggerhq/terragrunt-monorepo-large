include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/storage/backup-261",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-1/monitoring/log-aggregation-8",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/application/queue-505",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/monitoring/prometheus-716",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-510?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-510"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}