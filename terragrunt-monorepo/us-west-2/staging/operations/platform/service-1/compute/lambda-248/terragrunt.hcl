include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/application/service-1/storage/s3-905",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/security/certificates-181",
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/application/api-gateway-201",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/security/shield-292",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-248?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-248"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}