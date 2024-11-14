include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/security/shield-764",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/application/event-bus-786",
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/monitoring/alertmanager-311",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/monitoring/cloudwatch-34",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/security/guardduty-148",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-300?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-300"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}