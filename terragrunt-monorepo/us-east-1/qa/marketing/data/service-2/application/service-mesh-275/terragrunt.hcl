include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/compute/ecs-977",
    "../../../../../../../../us-west-2/dev/operations/application/service-1/network/transit-gateway-179",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/monitoring/trace-collection-780",
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/monitoring/alertmanager-841",
    "../../../../../../../../us-west-2/qa/operations/data/service-1/application/event-bus-682",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-275?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-275"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}