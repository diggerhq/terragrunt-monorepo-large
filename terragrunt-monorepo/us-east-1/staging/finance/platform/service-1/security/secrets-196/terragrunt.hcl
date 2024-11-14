include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/network/vpc-237",
    "../../../../../../../../us-east-1/staging/finance/data/service-3/storage/dynamodb-553",
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/application/load-balancer-169",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/compute/ecs-104",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-196?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-196"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}