include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/monitoring/trace-collection-735",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/network/nacl-594",
    "../../../../../../../../us-west-2/staging/finance/application/service-2/compute/ec2-96",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-114?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-114"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}