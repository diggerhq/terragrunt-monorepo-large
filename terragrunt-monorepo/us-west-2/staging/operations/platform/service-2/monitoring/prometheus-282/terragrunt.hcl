include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/application/service-1/monitoring/alertmanager-386",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/storage/rds-473",
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/application/api-gateway-851",
    "../../../../../../../../us-east-1/dev/operations/application/service-1/storage/elasticache-157",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-282?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-282"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}