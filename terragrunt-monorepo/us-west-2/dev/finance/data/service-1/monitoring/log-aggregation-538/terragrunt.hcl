include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/monitoring/trace-collection-831",
    "../../../../../../../../us-west-2/staging/finance/application/service-3/application/event-bus-766",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/monitoring/cloudwatch-807",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/compute/ecs-131",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-538?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-538"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}