include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/security/shield-458",
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/compute/lambda-717",
    "../../../../../../../../us-west-2/staging/finance/application/service-1/storage/rds-473",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/network/subnet-145",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-44?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-44"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}