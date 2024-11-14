include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/network/nacl-36",
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/storage/redshift-869",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/security/guardduty-977",
    "../../../../../../../../us-west-2/qa/marketing/data/service-3/compute/fargate-397",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-867?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-867"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}