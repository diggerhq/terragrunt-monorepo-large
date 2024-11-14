include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/storage/dynamodb-222",
    "../../../../../../../../us-west-2/dev/finance/application/service-3/network/subnet-243",
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/application/api-gateway-811",
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/application/api-gateway-255",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/network/vpc-213",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//elasticache-352?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "elasticache-352"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}