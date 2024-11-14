include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/compute/batch-801",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-1/monitoring/log-aggregation-391",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/network/vpc-960",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/application/cache-layer-627",
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/storage/rds-452",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-615?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-615"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}