include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/platform/service-3/compute/batch-933",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-3/compute/spot-fleet-795",
    "../../../../../../../../us-east-1/staging/marketing/data/service-1/application/load-balancer-29",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-208?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-208"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}