include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-3/network/vpn-477",
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/storage/rds-279",
    "../../../../../../../../us-east-1/dev/operations/application/service-2/monitoring/log-aggregation-909",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/monitoring/log-aggregation-981",
    "../../../../../../../../us-east-1/staging/marketing/application/service-2/compute/batch-533",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//nacl-573?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "nacl-573"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}