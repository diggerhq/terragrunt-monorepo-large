include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/application/service-2/monitoring/cloudwatch-596",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/network/route-table-503",
    "../../../../../../../../us-west-2/qa/finance/data/service-1/application/api-gateway-457",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/network/route-table-131",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-620?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-620"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}