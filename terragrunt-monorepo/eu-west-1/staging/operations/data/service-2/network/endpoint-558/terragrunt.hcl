include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/network/vpc-960",
    "../../../../../../../../us-west-2/qa/operations/application/service-3/security/waf-651",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-2/compute/auto-scaling-473",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/application/event-bus-42",
    "../../../../../../../../us-west-2/dev/operations/application/service-1/monitoring/alertmanager-836",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-558?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-558"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}