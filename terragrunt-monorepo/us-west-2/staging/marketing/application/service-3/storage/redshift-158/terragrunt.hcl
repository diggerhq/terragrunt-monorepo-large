include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/storage/s3-93",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/application/cache-layer-530",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-3/monitoring/trace-collection-578",
    "../../../../../../../../eu-west-1/qa/operations/application/service-1/security/certificates-23",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-158?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-158"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}