include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/network/nacl-201",
    "../../../../../../../../us-west-2/dev/operations/data/service-3/security/secrets-375",
    "../../../../../../../../us-east-1/dev/finance/application/service-2/monitoring/log-aggregation-884",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/security/certificates-588",
    "../../../../../../../../us-west-2/staging/operations/data/service-1/storage/fsx-445",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-105?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-105"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}