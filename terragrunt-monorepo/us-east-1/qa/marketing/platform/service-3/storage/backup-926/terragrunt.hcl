include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/data/service-3/security/waf-994",
    "../../../../../../../../us-west-2/staging/operations/data/service-1/network/route-table-597",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/security/waf-481",
    "../../../../../../../../us-east-1/staging/finance/data/service-1/storage/efs-485",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/storage/s3-173",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-926?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-926"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}