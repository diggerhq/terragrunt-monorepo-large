include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/monitoring/log-aggregation-956",
    "../../../../../../../../eu-west-1/dev/operations/application/service-3/network/direct-connect-434",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/application/event-bus-744",
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/monitoring/prometheus-919",
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/security/security-hub-870",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-326?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-326"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}