include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/data/service-1/application/service-mesh-524",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/compute/ecs-788",
    "../../../../../../../../us-west-2/staging/operations/application/service-3/monitoring/cloudwatch-712",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-610?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-610"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}