include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/storage/dynamodb-913",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-1/network/subnet-684",
    "../../../../../../../../us-west-2/qa/finance/application/service-3/security/security-hub-188",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-986?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-986"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}