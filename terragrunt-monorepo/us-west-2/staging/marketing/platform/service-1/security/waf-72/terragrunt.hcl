include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/security/kms-743",
    "../../../../../../../../us-west-2/staging/finance/data/service-2/network/vpn-523",
    "../../../../../../../../us-west-2/qa/operations/platform/service-1/application/cache-layer-725",
    "../../../../../../../../us-west-2/dev/finance/application/service-2/storage/efs-795",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-3/security/secrets-162",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-72?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-72"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}