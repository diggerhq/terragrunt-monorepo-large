include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/data/service-3/security/secrets-329",
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/application/load-balancer-829",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/network/direct-connect-952",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/storage/dynamodb-620",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-225?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-225"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}