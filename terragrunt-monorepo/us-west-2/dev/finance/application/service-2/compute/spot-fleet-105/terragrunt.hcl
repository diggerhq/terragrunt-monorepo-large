include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/platform/service-3/monitoring/trace-collection-692",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-3/network/route-table-349",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/monitoring/grafana-758",
    "../../../../../../../../us-west-2/qa/marketing/data/service-3/storage/redshift-758",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/compute/spot-fleet-51",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-105?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-105"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}