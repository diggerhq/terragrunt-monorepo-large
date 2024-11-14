include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/storage/elasticache-800",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/application/api-gateway-792",
    "../../../../../../../../us-east-1/qa/marketing/data/service-2/network/transit-gateway-403",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-906?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-906"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}