include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/platform/service-3/storage/backup-926",
    "../../../../../../../../us-west-2/qa/operations/platform/service-3/network/subnet-400",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/monitoring/grafana-184",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/application/event-bus-256",
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/security/guardduty-543",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-826?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-826"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}