include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/application/service-3/monitoring/cloudwatch-916",
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/application/cache-layer-261",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/storage/fsx-620",
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/network/endpoint-818",
    "../../../../../../../../us-east-1/dev/finance/application/service-2/network/subnet-416",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-878?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-878"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}