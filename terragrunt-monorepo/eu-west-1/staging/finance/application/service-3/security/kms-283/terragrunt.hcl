include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/monitoring/alertmanager-159",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/monitoring/log-aggregation-677",
    "../../../../../../../../us-west-2/qa/finance/application/service-3/monitoring/grafana-907",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/security/guardduty-977",
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/network/transit-gateway-648",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//kms-283?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "kms-283"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}