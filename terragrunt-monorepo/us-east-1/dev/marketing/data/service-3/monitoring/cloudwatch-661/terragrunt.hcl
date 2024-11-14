include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/application/service-3/application/queue-254",
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/network/endpoint-707",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/security/security-hub-343",
    "../../../../../../../../us-east-1/qa/operations/application/service-1/security/kms-505",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/application/cache-layer-74",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-661?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-661"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}