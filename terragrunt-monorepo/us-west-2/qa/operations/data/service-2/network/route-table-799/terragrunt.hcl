include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/platform/service-1/network/endpoint-35",
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/security/secrets-425",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/monitoring/grafana-681",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-799?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-799"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}