include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/security/certificates-574",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/security/shield-473",
    "../../../../../../../../us-west-2/staging/finance/data/service-2/security/security-hub-141",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-2/security/certificates-681",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-106?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-106"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}