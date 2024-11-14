include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/platform/service-3/compute/batch-933",
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/network/transit-gateway-723",
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/network/transit-gateway-489",
    "../../../../../../../../us-east-1/qa/operations/data/service-2/storage/s3-715",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/application/cache-layer-78",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-590?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-590"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}