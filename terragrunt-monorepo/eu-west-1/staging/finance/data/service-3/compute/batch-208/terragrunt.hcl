include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/data/service-3/security/secrets-631",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/compute/auto-scaling-781",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/security/waf-862",
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/storage/s3-396",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/monitoring/cloudwatch-359",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-208?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-208"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}