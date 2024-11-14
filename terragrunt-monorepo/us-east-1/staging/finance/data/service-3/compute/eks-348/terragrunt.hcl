include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/monitoring/grafana-256",
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/monitoring/log-aggregation-77",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/storage/fsx-81",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/storage/redshift-28",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-348?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-348"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}