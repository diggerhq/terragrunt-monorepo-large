include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/data/service-2/application/load-balancer-803",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/network/subnet-649",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/monitoring/log-aggregation-496",
    "../../../../../../../../us-west-2/staging/operations/platform/service-2/application/service-mesh-83",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-311?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-311"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}