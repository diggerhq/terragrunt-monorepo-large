include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/data/service-3/storage/elasticache-120",
    "../../../../../../../../us-west-2/qa/marketing/application/service-2/monitoring/grafana-300",
    "../../../../../../../../us-west-2/qa/operations/application/service-1/application/api-gateway-436",
    "../../../../../../../../us-east-1/dev/finance/application/service-1/monitoring/prometheus-391",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/application/cache-layer-869",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-129?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-129"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}