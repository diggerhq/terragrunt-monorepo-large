include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/data/service-2/monitoring/trace-collection-819",
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/application/service-mesh-175",
    "../../../../../../../../us-west-2/qa/operations/data/service-1/application/event-bus-682",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/network/nacl-339",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//nacl-646?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "nacl-646"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}