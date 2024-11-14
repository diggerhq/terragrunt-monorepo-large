include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/application/event-bus-577",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/application/service-mesh-782",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/monitoring/log-aggregation-709",
    "../../../../../../../../us-east-1/qa/finance/application/service-3/monitoring/alertmanager-45",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-649?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-649"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}