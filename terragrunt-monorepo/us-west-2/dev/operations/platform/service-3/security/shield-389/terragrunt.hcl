include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/application/service-3/storage/elasticache-479",
    "../../../../../../../../us-east-1/dev/operations/platform/service-1/storage/redshift-78",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/security/waf-507",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/compute/spot-fleet-713",
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/network/nacl-617",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-389?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-389"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}