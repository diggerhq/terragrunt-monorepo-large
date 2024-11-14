include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/monitoring/alertmanager-539",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/network/nacl-935",
    "../../../../../../../../us-west-2/dev/marketing/data/service-2/compute/ecs-362",
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/network/direct-connect-672",
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/network/endpoint-683",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-419?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-419"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}