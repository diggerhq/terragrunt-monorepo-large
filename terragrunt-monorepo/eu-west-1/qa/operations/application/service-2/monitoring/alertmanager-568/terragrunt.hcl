include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/data/service-3/monitoring/grafana-207",
    "../../../../../../../../us-east-1/dev/marketing/application/service-3/network/nacl-326",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/monitoring/prometheus-533",
    "../../../../../../../../us-east-1/staging/finance/data/service-3/storage/dynamodb-553",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-568?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-568"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}