include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/application/service-1/network/direct-connect-935",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/compute/batch-692",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/storage/dynamodb-451",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-523?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-523"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}