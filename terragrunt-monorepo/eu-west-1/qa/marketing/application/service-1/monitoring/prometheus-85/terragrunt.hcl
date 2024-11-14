include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/network/subnet-531",
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/storage/elasticache-98",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/application/api-gateway-107",
    "../../../../../../../../us-east-1/staging/finance/platform/service-3/storage/backup-73",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-85?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-85"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}