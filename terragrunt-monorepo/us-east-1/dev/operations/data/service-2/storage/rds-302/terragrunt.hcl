include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/monitoring/trace-collection-423",
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/security/kms-387",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/network/vpn-943",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-3/storage/elasticache-912",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-302?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-302"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}