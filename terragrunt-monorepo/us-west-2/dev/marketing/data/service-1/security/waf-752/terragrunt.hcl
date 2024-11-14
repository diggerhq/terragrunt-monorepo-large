include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/application/api-gateway-24",
    "../../../../../../../../us-west-2/dev/marketing/application/service-2/monitoring/log-aggregation-478",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/network/subnet-569",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-752?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-752"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}