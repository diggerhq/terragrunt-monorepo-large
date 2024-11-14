include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/data/service-3/monitoring/alertmanager-817",
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/network/transit-gateway-489",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/application/api-gateway-966",
    "../../../../../../../../us-east-1/qa/operations/application/service-2/storage/backup-20",
    "../../../../../../../../us-east-1/qa/marketing/data/service-2/monitoring/log-aggregation-774",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-319?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-319"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}