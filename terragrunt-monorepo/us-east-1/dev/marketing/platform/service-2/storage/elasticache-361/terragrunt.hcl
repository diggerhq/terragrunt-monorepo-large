include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/application/service-3/storage/fsx-403",
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/storage/dynamodb-307",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/security/shield-826",
    "../../../../../../../../us-west-2/dev/operations/application/service-1/network/direct-connect-998",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-1/storage/s3-588",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//elasticache-361?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "elasticache-361"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}