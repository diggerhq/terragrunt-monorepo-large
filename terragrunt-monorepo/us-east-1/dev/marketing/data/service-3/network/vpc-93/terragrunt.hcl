include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/platform/service-1/monitoring/alertmanager-468",
    "../../../../../../../../us-east-1/qa/finance/data/service-1/monitoring/grafana-55",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/security/iam-553",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-93?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-93"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}