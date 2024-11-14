include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-1/network/endpoint-153",
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/monitoring/grafana-291",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/monitoring/prometheus-749",
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/application/api-gateway-255",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-196?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-196"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}