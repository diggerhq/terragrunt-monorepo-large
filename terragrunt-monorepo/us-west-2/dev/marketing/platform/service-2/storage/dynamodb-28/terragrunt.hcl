include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/application/service-1/network/subnet-423",
    "../../../../../../../../us-east-1/qa/operations/platform/service-2/monitoring/cloudwatch-970",
    "../../../../../../../../us-east-1/staging/marketing/data/service-3/network/route-table-354",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-28?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-28"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}