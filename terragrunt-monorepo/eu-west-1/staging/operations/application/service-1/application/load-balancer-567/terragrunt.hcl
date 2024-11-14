include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/data/service-2/network/direct-connect-636",
    "../../../../../../../../us-west-2/dev/finance/data/service-1/monitoring/log-aggregation-538",
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/network/direct-connect-212",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-567?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-567"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}