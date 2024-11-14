include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/data/service-3/compute/spot-fleet-387",
    "../../../../../../../../us-west-2/qa/finance/application/service-2/application/queue-695",
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/application/event-bus-803",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-3/security/guardduty-912",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/network/endpoint-527",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-479?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-479"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}