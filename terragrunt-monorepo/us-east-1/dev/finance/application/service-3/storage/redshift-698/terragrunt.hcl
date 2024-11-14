include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/data/service-3/monitoring/alertmanager-933",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/monitoring/alertmanager-903",
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/application/cache-layer-233",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-2/monitoring/log-aggregation-159",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-698?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-698"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}