include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/data/service-1/storage/elasticache-634",
    "../../../../../../../../eu-west-1/qa/finance/application/service-1/application/load-balancer-65",
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/compute/spot-fleet-214",
    "../../../../../../../../eu-west-1/dev/finance/data/service-3/application/api-gateway-474",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-123?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-123"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}