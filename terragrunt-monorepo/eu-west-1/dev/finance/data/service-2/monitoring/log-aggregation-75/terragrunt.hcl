include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/data/service-2/storage/fsx-637",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/network/endpoint-324",
    "../../../../../../../../us-east-1/qa/marketing/data/service-2/network/subnet-559",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/network/subnet-189",
    "../../../../../../../../us-east-1/qa/marketing/data/service-3/compute/lambda-507",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-75?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-75"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}