include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/monitoring/trace-collection-750",
    "../../../../../../../../us-east-1/qa/operations/platform/service-2/monitoring/cloudwatch-970",
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/network/subnet-405",
    "../../../../../../../../us-east-1/staging/finance/platform/service-1/compute/lambda-155",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-52?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-52"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}