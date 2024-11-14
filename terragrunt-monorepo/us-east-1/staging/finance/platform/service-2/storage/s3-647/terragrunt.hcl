include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/data/service-3/application/cache-layer-839",
    "../../../../../../../../us-west-2/staging/operations/application/service-1/monitoring/log-aggregation-881",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/storage/redshift-222",
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/network/route-table-19",
    "../../../../../../../../us-west-2/dev/marketing/application/service-1/application/queue-48",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-647?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-647"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}