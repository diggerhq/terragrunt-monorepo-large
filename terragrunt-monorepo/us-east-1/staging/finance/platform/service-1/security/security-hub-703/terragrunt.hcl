include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/platform/service-1/application/cache-layer-725",
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/security/guardduty-261",
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/security/kms-975",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/monitoring/prometheus-240",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-703?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-703"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}