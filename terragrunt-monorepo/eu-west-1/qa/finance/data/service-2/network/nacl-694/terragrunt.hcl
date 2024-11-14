include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/network/transit-gateway-684",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/network/direct-connect-448",
    "../../../../../../../../us-west-2/staging/operations/platform/service-2/network/direct-connect-668",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/network/endpoint-633",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//nacl-694?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "nacl-694"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}