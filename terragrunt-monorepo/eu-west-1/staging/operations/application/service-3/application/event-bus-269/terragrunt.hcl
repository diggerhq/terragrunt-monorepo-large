include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/application/load-balancer-668",
    "../../../../../../../../us-east-1/qa/operations/application/service-2/application/load-balancer-866",
    "../../../../../../../../us-west-2/staging/finance/platform/service-3/compute/lambda-852",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-269?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-269"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}