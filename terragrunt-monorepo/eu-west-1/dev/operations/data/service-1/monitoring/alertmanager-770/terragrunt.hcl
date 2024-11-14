include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/network/vpn-350",
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/monitoring/prometheus-620",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/network/route-table-763",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/security/security-hub-122",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/network/endpoint-324",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-770?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-770"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}