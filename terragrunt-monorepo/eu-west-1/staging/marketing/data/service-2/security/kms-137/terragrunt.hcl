include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/data/service-2/monitoring/trace-collection-340",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-2/compute/ecs-45",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/monitoring/alertmanager-502",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/application/event-bus-151",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//kms-137?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "kms-137"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}