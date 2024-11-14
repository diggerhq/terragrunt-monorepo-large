include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/data/service-1/network/vpn-594",
    "../../../../../../../../us-east-1/staging/operations/application/service-2/security/iam-147",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/storage/fsx-901",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/storage/dynamodb-265",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-148?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-148"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}