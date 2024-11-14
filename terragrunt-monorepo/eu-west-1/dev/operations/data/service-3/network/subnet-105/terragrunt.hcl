include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/network/endpoint-255",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/application/service-mesh-797",
    "../../../../../../../../us-east-1/dev/finance/platform/service-3/network/direct-connect-584",
    "../../../../../../../../us-west-2/staging/operations/platform/service-1/compute/spot-fleet-9",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-105?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-105"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}