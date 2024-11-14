include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/application/service-3/network/route-table-754",
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/application/load-balancer-896",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-2/application/cache-layer-553",
    "../../../../../../../../us-west-2/qa/finance/platform/service-2/monitoring/cloudwatch-497",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-120?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-120"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}