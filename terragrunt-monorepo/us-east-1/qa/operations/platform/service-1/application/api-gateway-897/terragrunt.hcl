include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/data/service-2/monitoring/log-aggregation-761",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/application/queue-360",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-3/storage/backup-613",
    "../../../../../../../../eu-west-1/dev/operations/application/service-3/monitoring/alertmanager-151",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-897?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-897"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}