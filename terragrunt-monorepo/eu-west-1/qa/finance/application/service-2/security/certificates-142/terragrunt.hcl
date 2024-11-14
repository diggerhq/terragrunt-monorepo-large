include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/application/service-3/application/event-bus-318",
    "../../../../../../../../us-west-2/qa/operations/data/service-1/monitoring/cloudwatch-397",
    "../../../../../../../../us-east-1/dev/operations/platform/service-1/security/shield-161",
    "../../../../../../../../us-east-1/qa/finance/data/service-2/network/direct-connect-4",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-142?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-142"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}