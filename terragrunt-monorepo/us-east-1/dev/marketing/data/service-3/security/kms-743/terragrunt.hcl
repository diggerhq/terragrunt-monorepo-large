include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/application/service-3/monitoring/log-aggregation-585",
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/security/kms-978",
    "../../../../../../../../us-west-2/qa/finance/application/service-1/security/certificates-175",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//kms-743?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "kms-743"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}