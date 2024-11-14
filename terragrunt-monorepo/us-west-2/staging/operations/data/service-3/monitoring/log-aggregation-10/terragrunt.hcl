include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/data/service-1/monitoring/alertmanager-596",
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/monitoring/log-aggregation-986",
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/security/secrets-749",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/compute/auto-scaling-747",
    "../../../../../../../../us-east-1/dev/marketing/data/service-2/storage/s3-248",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-10?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-10"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}