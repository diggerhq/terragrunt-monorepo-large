include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/data/service-1/storage/elasticache-359",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-2/storage/dynamodb-447",
    "../../../../../../../../us-east-1/qa/operations/data/service-2/application/service-mesh-168",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-613?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-613"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}