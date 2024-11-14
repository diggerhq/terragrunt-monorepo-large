include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/application/service-2/monitoring/log-aggregation-554",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/storage/redshift-499",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-2/application/cache-layer-553",
    "../../../../../../../../us-west-2/qa/operations/data/service-1/monitoring/cloudwatch-301",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-159?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-159"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}