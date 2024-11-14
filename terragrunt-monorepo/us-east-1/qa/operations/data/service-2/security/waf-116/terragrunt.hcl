include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/platform/service-2/monitoring/alertmanager-361",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/security/waf-149",
    "../../../../../../../../us-west-2/staging/finance/application/service-1/monitoring/cloudwatch-847",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-2/network/vpn-487",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-116?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-116"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}