include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/security/kms-207",
    "../../../../../../../../eu-west-1/staging/finance/data/service-1/compute/spot-fleet-450",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/storage/backup-654",
    "../../../../../../../../us-east-1/qa/marketing/data/service-2/security/guardduty-854",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-129?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-129"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}