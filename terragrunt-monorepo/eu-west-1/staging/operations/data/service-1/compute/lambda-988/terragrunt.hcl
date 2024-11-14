include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/network/vpn-560",
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/security/guardduty-22",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/storage/redshift-270",
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/security/certificates-617",
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/network/route-table-742",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-988?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-988"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}