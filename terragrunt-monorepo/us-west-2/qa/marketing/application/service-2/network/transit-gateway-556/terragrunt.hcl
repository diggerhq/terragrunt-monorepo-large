include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/data/service-1/security/secrets-130",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/security/shield-77",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/application/api-gateway-226",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-556?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-556"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}