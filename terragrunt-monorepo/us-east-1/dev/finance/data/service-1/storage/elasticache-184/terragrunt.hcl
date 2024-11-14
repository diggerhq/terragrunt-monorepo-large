include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/application/service-2/monitoring/log-aggregation-884",
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/application/load-balancer-898",
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/application/api-gateway-945",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//elasticache-184?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "elasticache-184"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}