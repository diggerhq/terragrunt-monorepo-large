include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/compute/batch-598",
    "../../../../../../../../us-west-2/dev/finance/application/service-1/storage/efs-747",
    "../../../../../../../../us-east-1/staging/marketing/data/service-3/storage/elasticache-784",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/network/vpc-207",
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/storage/dynamodb-115",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-151?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-151"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}