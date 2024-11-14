include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/network/subnet-28",
    "../../../../../../../../us-west-2/staging/operations/platform/service-1/application/service-mesh-322",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/security/iam-285",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/application/event-bus-42",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-945?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-945"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}