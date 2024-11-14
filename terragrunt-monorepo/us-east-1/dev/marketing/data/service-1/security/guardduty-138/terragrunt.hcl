include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/storage/efs-860",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/compute/spot-fleet-827",
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/security/iam-284",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/storage/rds-211",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/monitoring/log-aggregation-948",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-138?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-138"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}