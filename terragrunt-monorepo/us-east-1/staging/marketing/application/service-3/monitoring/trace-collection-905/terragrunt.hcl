include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/security/iam-21",
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/compute/auto-scaling-365",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/storage/redshift-897",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-1/compute/lambda-907",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-2/storage/rds-12",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-905?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-905"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}