include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/application/service-3/monitoring/grafana-73",
    "../../../../../../../../us-west-2/qa/finance/application/service-3/monitoring/grafana-907",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/security/shield-369",
    "../../../../../../../../us-west-2/dev/operations/platform/service-3/network/direct-connect-40",
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/compute/auto-scaling-386",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-712?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-712"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}