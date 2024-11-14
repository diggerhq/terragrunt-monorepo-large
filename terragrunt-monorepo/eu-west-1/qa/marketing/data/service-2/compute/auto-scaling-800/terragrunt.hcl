include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/security/security-hub-327",
    "../../../../../../../../us-east-1/dev/operations/application/service-1/storage/redshift-664",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/storage/rds-473",
    "../../../../../../../../us-west-2/staging/operations/application/service-2/security/security-hub-157",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-800?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-800"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}