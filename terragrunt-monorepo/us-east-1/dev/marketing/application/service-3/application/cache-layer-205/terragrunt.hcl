include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/monitoring/grafana-681",
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/application/load-balancer-460",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/storage/elasticache-165",
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/network/route-table-933",
    "../../../../../../../../us-east-1/qa/marketing/application/service-2/application/load-balancer-914",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-205?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-205"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}