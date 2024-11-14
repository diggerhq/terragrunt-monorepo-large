include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/application/event-bus-198",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/security/waf-280",
    "../../../../../../../../us-east-1/qa/operations/application/service-3/network/transit-gateway-332",
    "../../../../../../../../eu-west-1/staging/operations/application/service-3/security/certificates-537",
    "../../../../../../../../us-west-2/dev/finance/application/service-1/monitoring/alertmanager-380",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-363?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-363"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}