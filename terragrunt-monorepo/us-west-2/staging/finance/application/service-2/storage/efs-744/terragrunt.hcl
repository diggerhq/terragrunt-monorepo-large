include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/security/certificates-444",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-744?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-744"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}