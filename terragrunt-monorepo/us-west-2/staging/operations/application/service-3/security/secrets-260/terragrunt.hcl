include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/application/service-1/network/transit-gateway-634",
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/storage/dynamodb-829",
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/monitoring/prometheus-303",
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/storage/redshift-76",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-260?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-260"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}