include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/application/cache-layer-522",
    "../../../../../../../../us-east-1/staging/marketing/data/service-1/monitoring/prometheus-318",
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/compute/spot-fleet-845",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-783?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-783"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}