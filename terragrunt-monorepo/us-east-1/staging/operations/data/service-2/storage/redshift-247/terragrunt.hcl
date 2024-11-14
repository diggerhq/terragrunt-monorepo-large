include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/storage/s3-63",
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/monitoring/grafana-585",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/monitoring/log-aggregation-149",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-247?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-247"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}