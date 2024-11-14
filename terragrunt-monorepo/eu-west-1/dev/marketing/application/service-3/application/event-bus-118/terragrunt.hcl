include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/compute/ecs-659",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/monitoring/cloudwatch-602",
    "../../../../../../../../us-east-1/qa/finance/data/service-1/application/queue-172",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-118?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-118"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}