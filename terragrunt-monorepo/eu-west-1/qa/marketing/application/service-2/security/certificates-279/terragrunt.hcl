include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/network/vpn-759",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/monitoring/log-aggregation-440",
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/application/api-gateway-697",
    "../../../../../../../../us-east-1/dev/operations/platform/service-1/security/shield-161",
    "../../../../../../../../us-east-1/staging/operations/application/service-2/monitoring/alertmanager-65",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-279?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-279"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}