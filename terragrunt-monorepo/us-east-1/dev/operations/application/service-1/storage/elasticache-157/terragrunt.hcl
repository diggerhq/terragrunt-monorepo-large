include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/monitoring/prometheus-749",
    "../../../../../../../../us-east-1/dev/operations/application/service-3/monitoring/trace-collection-865",
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/monitoring/trace-collection-905",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/network/route-table-503",
    "../../../../../../../../us-west-2/dev/operations/application/service-2/security/guardduty-708",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//elasticache-157?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "elasticache-157"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}