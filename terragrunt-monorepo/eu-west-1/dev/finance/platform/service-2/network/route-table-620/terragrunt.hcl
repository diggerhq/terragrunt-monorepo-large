include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/application/cache-layer-109",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/network/endpoint-712",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/monitoring/prometheus-509",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-3/application/queue-254",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-620?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-620"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}