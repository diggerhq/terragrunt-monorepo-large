include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/security/waf-182",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/network/vpn-560",
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/storage/redshift-847",
    "../../../../../../../../us-east-1/dev/marketing/application/service-3/network/nacl-326",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-807?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-807"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}