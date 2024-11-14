include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/application/cache-layer-675",
    "../../../../../../../../us-west-2/dev/finance/data/service-1/application/queue-293",
    "../../../../../../../../us-west-2/qa/operations/application/service-3/application/event-bus-173",
    "../../../../../../../../us-west-2/dev/operations/platform/service-3/monitoring/cloudwatch-87",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-387?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-387"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}