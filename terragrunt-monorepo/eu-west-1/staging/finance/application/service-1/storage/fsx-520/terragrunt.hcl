include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/storage/rds-449",
    "../../../../../../../../eu-west-1/staging/finance/data/service-1/security/security-hub-410",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/security/shield-764",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/security/guardduty-703",
    "../../../../../../../../us-west-2/qa/finance/data/service-2/network/endpoint-216",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-520?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-520"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}