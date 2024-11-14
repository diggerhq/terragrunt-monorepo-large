include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/application/cache-layer-242",
    "../../../../../../../../us-west-2/qa/operations/application/service-2/network/direct-connect-230",
    "../../../../../../../../us-west-2/staging/operations/platform/service-2/monitoring/cloudwatch-332",
    "../../../../../../../../us-west-2/staging/finance/application/service-1/monitoring/cloudwatch-958",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-411?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-411"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}