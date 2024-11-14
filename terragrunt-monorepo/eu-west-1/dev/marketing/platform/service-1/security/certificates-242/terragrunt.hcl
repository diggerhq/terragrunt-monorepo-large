include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/application/event-bus-551",
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/application/api-gateway-851",
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/monitoring/cloudwatch-41",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-242?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-242"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}