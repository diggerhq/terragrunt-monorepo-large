include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/application/api-gateway-12",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-2/security/kms-866",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/monitoring/trace-collection-693",
    "../../../../../../../../us-east-1/staging/operations/data/service-2/compute/auto-scaling-206",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/application/event-bus-459",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-104?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-104"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}