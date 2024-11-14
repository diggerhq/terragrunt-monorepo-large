include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/network/transit-gateway-759",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/security/guardduty-583",
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/monitoring/log-aggregation-11",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-481?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-481"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}