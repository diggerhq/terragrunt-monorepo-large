include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/monitoring/prometheus-422",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/application/event-bus-863",
    "../../../../../../../../us-east-1/staging/operations/application/service-1/security/iam-474",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/security/iam-161",
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/monitoring/grafana-209",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-789?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-789"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}