include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/security/secrets-991",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/security/waf-129",
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/application/cache-layer-903",
    "../../../../../../../../us-west-2/qa/marketing/application/service-2/compute/auto-scaling-335",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-606?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-606"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}