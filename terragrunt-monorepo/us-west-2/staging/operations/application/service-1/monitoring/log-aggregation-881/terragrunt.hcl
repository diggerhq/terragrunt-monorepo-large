include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/security/guardduty-532",
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/network/vpc-93",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-1/storage/dynamodb-612",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-881?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-881"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}