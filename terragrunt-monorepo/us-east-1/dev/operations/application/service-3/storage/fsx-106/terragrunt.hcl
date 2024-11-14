include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/storage/dynamodb-620",
    "../../../../../../../../us-east-1/staging/finance/platform/service-1/monitoring/trace-collection-898",
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/network/nacl-720",
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/network/vpn-806",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-106?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-106"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}