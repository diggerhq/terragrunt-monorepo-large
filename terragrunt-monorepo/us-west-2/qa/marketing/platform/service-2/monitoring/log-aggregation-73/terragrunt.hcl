include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/monitoring/alertmanager-411",
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/network/direct-connect-915",
    "../../../../../../../../eu-west-1/dev/operations/data/service-1/security/certificates-446",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-3/network/route-table-349",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-73?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-73"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}