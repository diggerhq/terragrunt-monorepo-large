include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/application/service-1/monitoring/prometheus-112",
    "../../../../../../../../us-east-1/staging/operations/application/service-2/security/iam-147",
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/monitoring/alertmanager-798",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/monitoring/grafana-641",
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/monitoring/grafana-567",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-497?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-497"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}