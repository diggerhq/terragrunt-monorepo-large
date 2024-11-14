include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/data/service-3/monitoring/alertmanager-9",
    "../../../../../../../../us-east-1/dev/finance/application/service-2/network/vpn-697",
    "../../../../../../../../us-west-2/staging/finance/application/service-3/storage/redshift-822",
    "../../../../../../../../us-east-1/staging/finance/application/service-3/security/guardduty-507",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-71?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-71"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}