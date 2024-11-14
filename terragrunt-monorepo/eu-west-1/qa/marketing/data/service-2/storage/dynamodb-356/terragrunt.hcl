include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/storage/dynamodb-265",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/network/vpc-670",
    "../../../../../../../../us-west-2/qa/operations/platform/service-1/security/security-hub-106",
    "../../../../../../../../us-west-2/qa/operations/application/service-1/network/direct-connect-811",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-356?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-356"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}