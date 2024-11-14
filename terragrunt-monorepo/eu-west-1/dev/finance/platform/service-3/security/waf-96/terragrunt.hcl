include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/monitoring/alertmanager-159",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/application/load-balancer-424",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/network/nacl-81",
    "../../../../../../../../us-west-2/qa/operations/data/service-3/monitoring/alertmanager-71",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-96?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-96"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}