include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/application/service-3/storage/backup-875",
    "../../../../../../../../eu-west-1/qa/operations/application/service-1/network/route-table-836",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-3/monitoring/log-aggregation-568",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-3/storage/fsx-795",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-729?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-729"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}