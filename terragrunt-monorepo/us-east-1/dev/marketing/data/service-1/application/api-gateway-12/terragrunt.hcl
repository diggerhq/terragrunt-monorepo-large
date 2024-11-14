include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-3/network/vpc-405",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/application/load-balancer-418",
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/monitoring/log-aggregation-704",
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/storage/fsx-878",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-12?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-12"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}