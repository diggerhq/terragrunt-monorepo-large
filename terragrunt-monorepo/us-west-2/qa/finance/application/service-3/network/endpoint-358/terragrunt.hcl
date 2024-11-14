include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/application/cache-layer-694",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/monitoring/log-aggregation-948",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/monitoring/alertmanager-501",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/storage/redshift-28",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-2/network/vpc-186",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-358?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-358"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}