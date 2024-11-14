include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/network/direct-connect-221",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/compute/lambda-983",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/compute/spot-fleet-713",
    "../../../../../../../../us-east-1/qa/finance/data/service-3/monitoring/trace-collection-51",
    "../../../../../../../../us-west-2/qa/finance/platform/service-2/application/cache-layer-645",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-528?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-528"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}