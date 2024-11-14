include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/security/shield-257",
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/security/certificates-103",
    "../../../../../../../../us-east-1/dev/operations/data/service-1/network/nacl-227",
    "../../../../../../../../us-west-2/qa/marketing/application/service-3/security/iam-989",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-9?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-9"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}