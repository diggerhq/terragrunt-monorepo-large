include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/application/service-2/security/guardduty-48",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/monitoring/log-aggregation-629",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/network/endpoint-206",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-3/network/direct-connect-489",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-829?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-829"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}