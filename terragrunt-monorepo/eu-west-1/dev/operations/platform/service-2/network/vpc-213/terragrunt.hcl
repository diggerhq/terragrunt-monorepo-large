include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-2/network/direct-connect-898",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-1/monitoring/trace-collection-402",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/storage/fsx-839",
    "../../../../../../../../us-east-1/dev/finance/application/service-1/storage/fsx-458",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-213?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-213"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}