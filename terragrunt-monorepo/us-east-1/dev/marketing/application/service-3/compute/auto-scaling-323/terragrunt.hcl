include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/data/service-3/monitoring/alertmanager-933",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/network/route-table-620",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/compute/auto-scaling-149",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-323?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-323"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}