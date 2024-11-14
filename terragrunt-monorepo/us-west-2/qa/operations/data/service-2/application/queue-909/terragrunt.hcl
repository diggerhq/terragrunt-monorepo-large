include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/data/service-2/compute/ec2-793",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/application/event-bus-42",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-2/monitoring/trace-collection-69",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-909?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-909"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}