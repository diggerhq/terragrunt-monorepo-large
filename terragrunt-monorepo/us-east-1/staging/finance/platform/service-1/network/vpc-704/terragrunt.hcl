include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/security/secrets-387",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/monitoring/log-aggregation-390",
    "../../../../../../../../us-west-2/staging/finance/application/service-3/application/load-balancer-441",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-704?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-704"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}