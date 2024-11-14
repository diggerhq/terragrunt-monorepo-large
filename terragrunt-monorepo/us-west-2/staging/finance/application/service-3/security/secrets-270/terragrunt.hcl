include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/application/event-bus-719",
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/network/nacl-459",
    "../../../../../../../../eu-west-1/qa/operations/application/service-1/storage/fsx-3",
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/network/route-table-933",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-270?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-270"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}