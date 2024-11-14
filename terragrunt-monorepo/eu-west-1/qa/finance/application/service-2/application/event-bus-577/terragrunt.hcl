include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/application/service-3/network/vpn-532",
    "../../../../../../../../us-east-1/dev/operations/data/service-3/application/cache-layer-557",
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/security/certificates-584",
    "../../../../../../../../us-east-1/staging/operations/application/service-2/network/route-table-267",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/compute/batch-708",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-577?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-577"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}