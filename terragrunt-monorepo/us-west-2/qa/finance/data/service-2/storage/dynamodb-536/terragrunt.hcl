include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/network/nacl-340",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/storage/dynamodb-265",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/compute/ecs-104",
    "../../../../../../../../us-east-1/dev/operations/data/service-2/compute/spot-fleet-635",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-536?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-536"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}