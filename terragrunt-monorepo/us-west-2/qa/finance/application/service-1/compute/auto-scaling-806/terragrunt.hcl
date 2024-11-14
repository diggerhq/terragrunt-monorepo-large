include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/security/guardduty-46",
    "../../../../../../../../us-east-1/qa/operations/application/service-2/storage/backup-20",
    "../../../../../../../../us-west-2/qa/finance/platform/service-2/security/guardduty-992",
    "../../../../../../../../us-east-1/dev/finance/platform/service-3/security/kms-715",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-806?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-806"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}