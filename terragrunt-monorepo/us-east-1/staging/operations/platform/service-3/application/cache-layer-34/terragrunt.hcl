include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/application/service-3/monitoring/trace-collection-377",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/storage/dynamodb-446",
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/storage/dynamodb-181",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/network/direct-connect-952",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-34?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-34"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}