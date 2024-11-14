include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/data/service-1/compute/fargate-93",
    "../../../../../../../../us-west-2/qa/operations/application/service-2/application/event-bus-298",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-2/monitoring/cloudwatch-792",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-393?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-393"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}