include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/application/service-2/compute/spot-fleet-105",
    "../../../../../../../../us-west-2/qa/finance/application/service-3/monitoring/log-aggregation-636",
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/storage/fsx-570",
    "../../../../../../../../us-east-1/staging/operations/data/service-2/monitoring/trace-collection-967",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-346?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-346"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}