include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/data/service-3/monitoring/trace-collection-837",
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/monitoring/log-aggregation-77",
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/application/event-bus-803",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-281?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-281"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}