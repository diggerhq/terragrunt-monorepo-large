include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/platform/service-2/monitoring/trace-collection-310",
    "../../../../../../../../us-east-1/staging/marketing/application/service-2/security/shield-587",
    "../../../../../../../../eu-west-1/staging/finance/data/service-1/monitoring/log-aggregation-785",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/application/load-balancer-869",
    "../../../../../../../../us-east-1/dev/marketing/data/service-2/compute/ecs-597",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-57?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-57"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}