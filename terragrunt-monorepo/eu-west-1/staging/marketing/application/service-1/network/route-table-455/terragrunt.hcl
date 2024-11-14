include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/platform/service-2/monitoring/cloudwatch-497",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-455?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-455"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}