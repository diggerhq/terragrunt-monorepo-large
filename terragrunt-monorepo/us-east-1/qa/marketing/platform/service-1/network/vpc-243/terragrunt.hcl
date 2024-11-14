include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-3/security/kms-188",
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/application/load-balancer-411",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-3/network/endpoint-241",
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/compute/ecs-104",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/application/api-gateway-107",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-243?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-243"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}