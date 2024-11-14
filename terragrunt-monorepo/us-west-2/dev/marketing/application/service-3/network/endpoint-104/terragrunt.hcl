include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/application/service-2/storage/dynamodb-124",
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/security/iam-353",
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/application/api-gateway-57",
    "../../../../../../../../us-east-1/dev/finance/data/service-2/application/load-balancer-803",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/storage/fsx-65",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-104?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-104"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}