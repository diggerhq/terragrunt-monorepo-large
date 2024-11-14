include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/application/service-3/monitoring/prometheus-536",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/network/direct-connect-173",
    "../../../../../../../../us-west-2/dev/operations/data/service-3/application/event-bus-96",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-982?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-982"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}