include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/platform/service-1/storage/dynamodb-17",
    "../../../../../../../../us-east-1/dev/finance/data/service-2/network/transit-gateway-465",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/application/api-gateway-289",
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/storage/dynamodb-702",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-163?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-163"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}