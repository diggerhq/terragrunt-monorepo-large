include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/application/service-3/monitoring/trace-collection-203",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/application/load-balancer-980",
    "../../../../../../../../us-east-1/qa/marketing/data/service-3/storage/fsx-850",
    "../../../../../../../../us-east-1/staging/finance/platform/service-3/network/vpn-706",
    "../../../../../../../../us-west-2/dev/marketing/data/service-2/compute/ecs-362",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-617?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-617"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}