include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/application/cache-layer-109",
    "../../../../../../../../us-west-2/qa/finance/data/service-2/storage/dynamodb-878",
    "../../../../../../../../us-east-1/qa/operations/application/service-1/storage/fsx-399",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/application/service-mesh-958",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-899?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-899"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}