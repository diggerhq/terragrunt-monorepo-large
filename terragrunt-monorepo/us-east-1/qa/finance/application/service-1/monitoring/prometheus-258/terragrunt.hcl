include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/application/service-2/application/load-balancer-442",
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/compute/auto-scaling-136",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/monitoring/grafana-707",
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/security/guardduty-618",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-258?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-258"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}