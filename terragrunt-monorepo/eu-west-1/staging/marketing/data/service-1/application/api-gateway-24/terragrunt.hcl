include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/application/load-balancer-169",
    "../../../../../../../../eu-west-1/qa/operations/application/service-1/compute/batch-630",
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/security/kms-978",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/monitoring/grafana-164",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-24?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-24"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}