include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/monitoring/trace-collection-360",
    "../../../../../../../../us-west-2/qa/finance/data/service-1/compute/ecs-760",
    "../../../../../../../../us-east-1/qa/operations/platform/service-2/application/event-bus-481",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-787?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-787"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}