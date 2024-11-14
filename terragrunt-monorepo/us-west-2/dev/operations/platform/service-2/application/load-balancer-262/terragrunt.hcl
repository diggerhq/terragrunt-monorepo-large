include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/storage/fsx-81",
    "../../../../../../../../us-west-2/qa/operations/platform/service-3/storage/redshift-632",
    "../../../../../../../../eu-west-1/dev/operations/data/service-1/storage/fsx-893",
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/application/event-bus-685",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/compute/spot-fleet-914",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-262?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-262"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}