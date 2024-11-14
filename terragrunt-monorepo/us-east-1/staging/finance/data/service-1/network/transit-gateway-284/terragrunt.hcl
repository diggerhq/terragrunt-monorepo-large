include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/data/service-2/monitoring/prometheus-740",
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/security/iam-40",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/storage/rds-99",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/application/service-mesh-980",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-3/monitoring/log-aggregation-568",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-284?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-284"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}