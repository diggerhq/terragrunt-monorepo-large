include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/application/cache-layer-630",
    "../../../../../../../../us-west-2/dev/finance/data/service-1/compute/fargate-844",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/compute/lambda-30",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/storage/dynamodb-451",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-115?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-115"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}