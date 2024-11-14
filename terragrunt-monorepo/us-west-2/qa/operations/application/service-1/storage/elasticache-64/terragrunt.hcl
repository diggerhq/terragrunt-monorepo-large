include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/data/service-2/monitoring/prometheus-875",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/storage/elasticache-981",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/storage/efs-656",
    "../../../../../../../../eu-west-1/dev/finance/application/service-3/network/transit-gateway-805",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//elasticache-64?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "elasticache-64"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}