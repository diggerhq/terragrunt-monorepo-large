include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/monitoring/log-aggregation-390",
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/application/queue-533",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/security/shield-566",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/application/load-balancer-598",
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/compute/spot-fleet-618",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-729?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-729"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}