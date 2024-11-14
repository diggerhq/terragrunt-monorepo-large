include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/storage/redshift-541",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/storage/dynamodb-446",
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/monitoring/log-aggregation-182",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-598?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-598"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}