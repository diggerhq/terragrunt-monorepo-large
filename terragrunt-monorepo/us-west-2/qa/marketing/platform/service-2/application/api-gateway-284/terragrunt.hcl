include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/monitoring/log-aggregation-948",
    "../../../../../../../../us-east-1/qa/finance/application/service-3/security/certificates-31",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/compute/auto-scaling-686",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-284?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-284"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}