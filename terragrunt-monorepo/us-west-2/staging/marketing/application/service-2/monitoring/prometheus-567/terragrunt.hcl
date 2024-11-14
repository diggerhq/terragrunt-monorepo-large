include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/monitoring/grafana-385",
    "../../../../../../../../us-east-1/qa/finance/data/service-2/compute/auto-scaling-398",
    "../../../../../../../../eu-west-1/qa/operations/application/service-1/network/transit-gateway-634",
    "../../../../../../../../us-west-2/staging/operations/application/service-2/application/api-gateway-625",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-567?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-567"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}