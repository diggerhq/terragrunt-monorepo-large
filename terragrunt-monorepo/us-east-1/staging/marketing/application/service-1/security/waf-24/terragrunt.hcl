include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/monitoring/log-aggregation-11",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-3/monitoring/prometheus-571",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/storage/s3-173",
    "../../../../../../../../us-west-2/dev/operations/platform/service-2/network/nacl-452",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-24?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-24"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}