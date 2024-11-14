include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/storage/dynamodb-451",
    "../../../../../../../../us-west-2/qa/operations/data/service-1/application/cache-layer-778",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/security/shield-379",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/compute/spot-fleet-536",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-712?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-712"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}