include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/application/service-1/monitoring/trace-collection-289",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/compute/lambda-712",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/storage/rds-99",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/network/direct-connect-670",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-746?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-746"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}