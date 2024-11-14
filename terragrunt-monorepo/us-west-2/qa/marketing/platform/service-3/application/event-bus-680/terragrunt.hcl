include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/monitoring/log-aggregation-981",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-1/compute/eks-659",
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/application/cache-layer-694",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/storage/efs-960",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-680?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-680"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}