include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/monitoring/prometheus-506",
    "../../../../../../../../us-west-2/qa/finance/platform/service-2/network/direct-connect-395",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/network/subnet-407",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-415?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-415"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}