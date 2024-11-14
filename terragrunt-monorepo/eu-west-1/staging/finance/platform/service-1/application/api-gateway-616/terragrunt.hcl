include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/storage/dynamodb-702",
    "../../../../../../../../us-west-2/dev/finance/application/service-2/application/cache-layer-600",
    "../../../../../../../../us-west-2/qa/marketing/data/service-3/storage/redshift-758",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-1/monitoring/cloudwatch-755",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/monitoring/log-aggregation-709",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-616?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-616"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}