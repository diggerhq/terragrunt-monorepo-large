include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/application/service-1/application/load-balancer-896",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/application/load-balancer-398",
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/monitoring/prometheus-998",
    "../../../../../../../../eu-west-1/qa/finance/application/service-1/application/api-gateway-947",
    "../../../../../../../../us-west-2/qa/operations/data/service-1/storage/backup-285",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-406?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-406"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}