include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/monitoring/log-aggregation-674",
    "../../../../../../../../us-west-2/staging/operations/platform/service-2/security/certificates-846",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/monitoring/log-aggregation-149",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-681?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-681"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}