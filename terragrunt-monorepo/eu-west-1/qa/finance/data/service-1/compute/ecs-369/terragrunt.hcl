include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/application/service-3/network/direct-connect-335",
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/network/vpc-93",
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/storage/elasticache-480",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/application/load-balancer-992",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-369?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-369"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}