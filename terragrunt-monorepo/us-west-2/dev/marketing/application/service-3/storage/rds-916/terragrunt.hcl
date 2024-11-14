include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/network/route-table-149",
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/monitoring/prometheus-686",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/security/certificates-715",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/compute/lambda-712",
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/network/direct-connect-979",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-916?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-916"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}