include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/security/secrets-91",
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/application/service-mesh-933",
    "../../../../../../../../us-west-2/dev/operations/data/service-3/network/vpn-27",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-1/storage/redshift-887",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-378?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-378"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}