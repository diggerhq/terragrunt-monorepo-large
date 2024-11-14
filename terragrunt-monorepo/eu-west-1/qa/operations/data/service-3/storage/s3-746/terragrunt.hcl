include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/platform/service-1/monitoring/cloudwatch-755",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/network/endpoint-253",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/monitoring/log-aggregation-708",
    "../../../../../../../../us-west-2/qa/marketing/data/service-3/storage/efs-430",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-746?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-746"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}