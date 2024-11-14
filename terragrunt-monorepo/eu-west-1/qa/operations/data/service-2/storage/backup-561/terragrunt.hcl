include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/application/load-balancer-387",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/security/iam-958",
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/monitoring/trace-collection-493",
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/network/direct-connect-899",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/monitoring/prometheus-543",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-561?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-561"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}