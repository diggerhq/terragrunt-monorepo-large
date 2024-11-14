include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/application/service-3/monitoring/prometheus-397",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-1/storage/s3-916",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/security/guardduty-879",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-1/compute/batch-659",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-431?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-431"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}