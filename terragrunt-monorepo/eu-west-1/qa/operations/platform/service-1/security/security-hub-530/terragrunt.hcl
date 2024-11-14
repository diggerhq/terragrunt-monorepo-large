include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/application/event-bus-876",
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/network/route-table-121",
    "../../../../../../../../us-east-1/dev/finance/data/service-2/security/security-hub-33",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/application/cache-layer-942",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-530?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-530"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}