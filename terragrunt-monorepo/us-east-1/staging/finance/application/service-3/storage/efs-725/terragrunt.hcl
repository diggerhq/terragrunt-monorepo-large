include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/data/service-3/monitoring/alertmanager-933",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/application/event-bus-394",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/application/cache-layer-74",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-725?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-725"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}