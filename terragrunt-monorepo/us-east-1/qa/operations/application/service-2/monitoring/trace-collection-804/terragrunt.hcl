include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/network/subnet-55",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/compute/batch-562",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-2/security/secrets-134",
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/network/vpn-394",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-804?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-804"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}