include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/network/direct-connect-836",
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/network/direct-connect-774",
    "../../../../../../../../us-west-2/dev/finance/data/service-1/network/direct-connect-637",
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/compute/auto-scaling-552",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-157?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-157"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}