include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/storage/rds-557",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/security/secrets-141",
    "../../../../../../../../us-east-1/staging/finance/application/service-3/storage/efs-725",
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/security/waf-776",
    "../../../../../../../../us-east-1/qa/finance/application/service-1/network/direct-connect-394",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-675?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-675"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}