include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/network/nacl-646",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/monitoring/log-aggregation-587",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/application/cache-layer-637",
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/application/api-gateway-639",
    "../../../../../../../../us-west-2/qa/finance/application/service-2/compute/auto-scaling-991",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-138?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-138"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}