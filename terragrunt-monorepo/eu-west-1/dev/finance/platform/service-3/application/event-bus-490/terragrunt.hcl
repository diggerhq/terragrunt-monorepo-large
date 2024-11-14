include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/data/service-1/monitoring/trace-collection-327",
    "../../../../../../../../us-east-1/qa/operations/application/service-2/monitoring/trace-collection-804",
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/storage/redshift-274",
    "../../../../../../../../eu-west-1/qa/operations/application/service-1/application/cache-layer-217",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-490?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-490"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}