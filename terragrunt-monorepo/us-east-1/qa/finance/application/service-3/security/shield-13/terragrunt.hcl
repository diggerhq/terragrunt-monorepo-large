include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/data/service-1/application/load-balancer-719",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-2/storage/elasticache-217",
    "../../../../../../../../us-west-2/dev/marketing/data/service-2/security/guardduty-529",
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/security/iam-744",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-13?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-13"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}