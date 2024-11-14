include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/application/queue-327",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-2/compute/spot-fleet-897",
    "../../../../../../../../eu-west-1/qa/finance/application/service-1/network/subnet-412",
    "../../../../../../../../eu-west-1/dev/operations/data/service-1/monitoring/alertmanager-770",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//kms-290?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "kms-290"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}