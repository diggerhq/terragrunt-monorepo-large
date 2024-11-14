include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/application/service-2/application/api-gateway-97",
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/monitoring/cloudwatch-22",
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/application/cache-layer-87",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-501?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-501"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}