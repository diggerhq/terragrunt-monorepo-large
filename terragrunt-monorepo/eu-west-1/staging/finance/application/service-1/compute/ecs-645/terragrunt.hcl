include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/application/cache-layer-619",
    "../../../../../../../../us-east-1/staging/finance/platform/service-1/storage/dynamodb-647",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/storage/dynamodb-43",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-2/application/cache-layer-638",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-645?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-645"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}