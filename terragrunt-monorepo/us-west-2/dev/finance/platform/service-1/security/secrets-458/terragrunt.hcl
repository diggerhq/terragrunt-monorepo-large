include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/network/subnet-798",
    "../../../../../../../../us-east-1/staging/operations/application/service-1/application/event-bus-763",
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/monitoring/cloudwatch-22",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/security/security-hub-555",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-458?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-458"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}