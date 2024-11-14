include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/security/kms-500",
    "../../../../../../../../us-west-2/qa/finance/data/service-3/storage/efs-159",
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/storage/dynamodb-829",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-384?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-384"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}