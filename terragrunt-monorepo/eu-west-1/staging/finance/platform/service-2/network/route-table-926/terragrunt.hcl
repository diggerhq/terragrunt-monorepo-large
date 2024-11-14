include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/data/service-1/storage/redshift-301",
    "../../../../../../../../eu-west-1/qa/finance/data/service-2/security/secrets-628",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-3/security/certificates-858",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-926?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-926"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}