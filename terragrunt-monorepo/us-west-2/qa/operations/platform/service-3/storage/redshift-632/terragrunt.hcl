include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/application/api-gateway-215",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/network/endpoint-712",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/monitoring/cloudwatch-678",
    "../../../../../../../../us-east-1/qa/operations/platform/service-2/application/event-bus-481",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-632?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-632"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}