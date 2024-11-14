include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/platform/service-1/monitoring/alertmanager-258",
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/security/waf-64",
    "../../../../../../../../us-east-1/staging/operations/data/service-1/application/load-balancer-106",
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/application/cache-layer-694",
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/monitoring/prometheus-422",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-21?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-21"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}