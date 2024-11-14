include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/data/service-3/storage/fsx-174",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/monitoring/alertmanager-981",
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/compute/spot-fleet-994",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-604?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-604"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}