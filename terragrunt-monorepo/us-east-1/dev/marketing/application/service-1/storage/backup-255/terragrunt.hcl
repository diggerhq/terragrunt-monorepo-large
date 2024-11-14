include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/application/service-2/security/kms-591",
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/application/cache-layer-903",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-2/security/waf-95",
    "../../../../../../../../us-east-1/dev/finance/application/service-3/storage/redshift-698",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-255?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-255"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}