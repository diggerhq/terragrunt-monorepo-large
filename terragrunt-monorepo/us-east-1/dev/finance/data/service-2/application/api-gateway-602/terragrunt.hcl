include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/compute/auto-scaling-954",
    "../../../../../../../../us-east-1/dev/marketing/application/service-2/compute/spot-fleet-579",
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/storage/elasticache-98",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-602?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-602"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}