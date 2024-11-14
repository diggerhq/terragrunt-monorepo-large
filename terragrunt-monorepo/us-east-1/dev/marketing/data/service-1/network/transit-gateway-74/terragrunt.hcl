include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/data/service-3/storage/dynamodb-352",
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/network/subnet-795",
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/monitoring/log-aggregation-77",
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/security/iam-640",
    "../../../../../../../../us-east-1/qa/operations/application/service-1/security/kms-505",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-74?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-74"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}