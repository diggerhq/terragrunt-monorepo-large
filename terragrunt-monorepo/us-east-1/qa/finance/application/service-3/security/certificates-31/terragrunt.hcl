include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/network/subnet-279",
    "../../../../../../../../us-east-1/dev/finance/data/service-3/application/service-mesh-832",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/compute/lambda-13",
    "../../../../../../../../us-west-2/dev/operations/application/service-1/monitoring/prometheus-853",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-31?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-31"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}