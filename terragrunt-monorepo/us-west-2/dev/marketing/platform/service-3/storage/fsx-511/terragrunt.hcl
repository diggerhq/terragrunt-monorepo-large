include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/application/service-2/security/kms-418",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/security/waf-849",
    "../../../../../../../../us-east-1/qa/operations/platform/service-2/application/cache-layer-832",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/security/shield-369",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-511?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-511"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}