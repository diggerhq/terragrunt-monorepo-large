include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/security/guardduty-977",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-2/network/vpc-177",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-3/network/vpc-887",
    "../../../../../../../../us-east-1/staging/finance/platform/service-1/compute/lambda-155",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-793?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-793"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}