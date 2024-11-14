include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/application/service-3/monitoring/trace-collection-865",
    "../../../../../../../../us-west-2/qa/marketing/data/service-3/application/event-bus-904",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/network/endpoint-633",
    "../../../../../../../../us-west-2/staging/finance/data/service-1/network/endpoint-577",
    "../../../../../../../../us-east-1/qa/marketing/application/service-2/security/certificates-243",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//nacl-555?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "nacl-555"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}