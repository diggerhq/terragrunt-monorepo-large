include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/application/service-2/monitoring/trace-collection-804",
    "../../../../../../../../us-west-2/staging/operations/platform/service-1/monitoring/log-aggregation-898",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/monitoring/alertmanager-36",
    "../../../../../../../../us-west-2/qa/finance/data/service-2/monitoring/cloudwatch-542",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-511?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-511"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}