include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-3/compute/spot-fleet-955",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-3/compute/batch-197",
    "../../../../../../../../us-west-2/qa/marketing/data/service-2/application/load-balancer-862",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-673?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-673"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}