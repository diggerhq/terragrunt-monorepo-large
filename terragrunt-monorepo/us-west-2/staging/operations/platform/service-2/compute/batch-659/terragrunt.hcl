include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/storage/s3-842",
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/monitoring/alertmanager-756",
    "../../../../../../../../us-west-2/qa/operations/platform/service-1/application/cache-layer-725",
    "../../../../../../../../us-west-2/staging/operations/data/service-1/network/nacl-622",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-659?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-659"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}