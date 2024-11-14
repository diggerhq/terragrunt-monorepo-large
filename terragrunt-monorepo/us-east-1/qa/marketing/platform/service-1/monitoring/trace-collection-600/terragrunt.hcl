include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/data/service-2/storage/elasticache-440",
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/monitoring/trace-collection-86",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/monitoring/log-aggregation-395",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-2/compute/lambda-459",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-600?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-600"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}