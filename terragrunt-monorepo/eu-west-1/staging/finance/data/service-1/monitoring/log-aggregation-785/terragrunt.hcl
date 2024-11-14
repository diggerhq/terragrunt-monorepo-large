include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/platform/service-2/application/service-mesh-856",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/application/queue-787",
    "../../../../../../../../us-east-1/qa/finance/data/service-1/compute/auto-scaling-675",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/compute/ecs-612",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-785?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-785"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}