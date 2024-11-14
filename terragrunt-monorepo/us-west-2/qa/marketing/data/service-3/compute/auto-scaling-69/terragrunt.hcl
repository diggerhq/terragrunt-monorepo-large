include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/data/service-2/security/certificates-565",
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/security/shield-257",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/storage/rds-557",
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/application/cache-layer-34",
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/security/certificates-691",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-69?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-69"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}