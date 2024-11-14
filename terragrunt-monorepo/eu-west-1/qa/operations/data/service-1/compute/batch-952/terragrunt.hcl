include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/security/waf-810",
    "../../../../../../../../us-east-1/staging/finance/platform/service-3/network/route-table-659",
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/compute/lambda-988",
    "../../../../../../../../us-west-2/staging/finance/application/service-3/storage/redshift-822",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-952?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-952"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}