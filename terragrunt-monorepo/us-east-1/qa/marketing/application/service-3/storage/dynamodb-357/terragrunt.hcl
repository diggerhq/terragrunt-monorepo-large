include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/security/certificates-718",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/monitoring/log-aggregation-16",
    "../../../../../../../../us-west-2/qa/marketing/application/service-1/security/shield-109",
    "../../../../../../../../us-west-2/dev/marketing/application/service-2/network/nacl-533",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-357?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-357"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}