include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/data/service-3/monitoring/cloudwatch-296",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/compute/auto-scaling-991",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/monitoring/cloudwatch-105",
    "../../../../../../../../eu-west-1/staging/finance/data/service-1/security/security-hub-410",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/security/kms-314",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-887?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-887"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}