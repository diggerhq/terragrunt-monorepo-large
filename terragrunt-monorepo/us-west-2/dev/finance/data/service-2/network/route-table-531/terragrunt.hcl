include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/data/service-2/compute/auto-scaling-405",
    "../../../../../../../../us-east-1/qa/operations/application/service-2/compute/batch-783",
    "../../../../../../../../eu-west-1/qa/finance/data/service-2/compute/auto-scaling-775",
    "../../../../../../../../us-east-1/dev/marketing/application/service-3/compute/spot-fleet-166",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-531?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-531"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}