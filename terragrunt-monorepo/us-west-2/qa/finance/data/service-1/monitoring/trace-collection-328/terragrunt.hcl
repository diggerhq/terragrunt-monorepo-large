include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/application/service-3/application/load-balancer-465",
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/compute/auto-scaling-552",
    "../../../../../../../../us-west-2/staging/operations/application/service-2/network/subnet-712",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-1/application/event-bus-682",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/network/nacl-72",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-328?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-328"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}