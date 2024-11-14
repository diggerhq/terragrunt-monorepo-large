include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/application/service-mesh-784",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/monitoring/grafana-831",
    "../../../../../../../../us-east-1/qa/operations/application/service-1/application/load-balancer-526",
    "../../../../../../../../us-west-2/qa/operations/data/service-2/monitoring/alertmanager-856",
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/storage/fsx-407",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-9?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-9"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}