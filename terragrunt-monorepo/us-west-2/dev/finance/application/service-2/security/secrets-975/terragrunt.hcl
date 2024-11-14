include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/application/service-1/storage/backup-744",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/storage/dynamodb-265",
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/security/waf-624",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/compute/auto-scaling-221",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/storage/fsx-253",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-975?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-975"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}