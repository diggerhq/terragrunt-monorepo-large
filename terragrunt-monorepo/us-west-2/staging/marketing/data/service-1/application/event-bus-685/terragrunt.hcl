include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/monitoring/trace-collection-772",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/application/event-bus-256",
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/storage/fsx-944",
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/application/queue-188",
    "../../../../../../../../us-east-1/dev/marketing/data/service-2/network/subnet-877",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-685?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-685"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}