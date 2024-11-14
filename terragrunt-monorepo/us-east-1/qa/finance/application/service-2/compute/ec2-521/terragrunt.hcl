include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/application/cache-layer-581",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/security/kms-816",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-3/storage/backup-926",
    "../../../../../../../../us-west-2/staging/finance/application/service-3/security/security-hub-746",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/security/guardduty-336",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-521?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-521"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}