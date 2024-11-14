include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/storage/backup-931",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/storage/redshift-242",
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/monitoring/log-aggregation-981",
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/compute/ecs-818",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/compute/lambda-13",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-301?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-301"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}