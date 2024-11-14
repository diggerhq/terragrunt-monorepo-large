include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/application/load-balancer-109",
    "../../../../../../../../us-east-1/dev/operations/application/service-2/network/endpoint-736",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-1/network/route-table-716",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/network/route-table-368",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/compute/ecs-183",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-854?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-854"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}