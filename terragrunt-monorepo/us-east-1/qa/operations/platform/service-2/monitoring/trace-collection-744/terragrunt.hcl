include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/application/event-bus-151",
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/application/event-bus-719",
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/network/route-table-19",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-3/application/service-mesh-749",
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/monitoring/trace-collection-622",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-744?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-744"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}